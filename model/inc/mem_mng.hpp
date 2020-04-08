
// Filename: gp_mem_mng.h

//----------------------------------------------------------------------
//  Copyright (c) 2008-2009 by Doulos Ltd.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//----------------------------------------------------------------------

// Version 1  03-Jul-2009


// *******************************************************************
// User-defined memory manager, which maintains a pool of transactions
// *******************************************************************

#pragma once


#include "tlm.h"


class mem_mng : public tlm::tlm_mm_interface
{
    typedef tlm::tlm_generic_payload gp_t;
    public:
        mem_mng() : free_list(0), empties(0) {}

        ~mem_mng()
        {
            gp_t* ptr;

            while (free_list)
            {
                ptr = free_list->trans;

                // Delete generic payload and all extensions
                assert(ptr);
                delete ptr;

                free_list = free_list->next;
            }

            while (empties)
            {
                access* x = empties;
                empties = empties->next;

                // Delete free list access struct
                delete x;
            }
        }

        mem_mng::gp_t* allocate()
        {
            gp_t* ptr;
            if (free_list)
            {
                ptr = free_list->trans;
                empties = free_list;
                free_list = free_list->next;
            }
            else
            {
                ptr = new gp_t(this);
            }
            return ptr;
        }

        void free(gp_t* trans)
        {
            trans->reset(); // Delete auto extensions
            if (!empties)
            {
                empties = new access;
                empties->next = free_list;
                empties->prev = 0;
                if (free_list)
                    free_list->prev = empties;
            }
            free_list = empties;
            free_list->trans = trans;
            empties = free_list->prev;
        }

        struct access
        {
            gp_t* trans;
            access* next;
            access* prev;
        };

        access* free_list;
        access* empties;
};
