@0;moduleinfo.sc;6;19;0;gnuc;5;3;0

F23;/home/software/mentor-2019/questasim/include/systemc/tlm_utils/multi_passthrough_initiator_socket.h
F22;/home/software/mentor-2019/questasim/include/systemc/tlm_utils/simple_initiator_socket.h
F21;/home/software/mentor-2019/questasim/include/systemc/sc_port.h
F20;/home/software/mentor-2019/questasim/include/systemc/tlm_gp.h
F19;/home/software/mentor-2019/questasim/gcc-5.3.0-linux_x86_64/include/c++/5.3.0/bits/allocator.h
F18;/home/software/mentor-2019/questasim/gcc-5.3.0-linux_x86_64/include/c++/5.3.0/bits/stl_bvector.h
F17;/home/software/mentor-2019/questasim/gcc-5.3.0-linux_x86_64/include/c++/5.3.0/bits/stl_iterator_base_types.h
F16;/home/software/mentor-2019/questasim/gcc-5.3.0-linux_x86_64/include/c++/5.3.0/bits/stl_vector.h
F15;/home/software/mentor-2019/questasim/gcc-5.3.0-linux_x86_64/include/c++/5.3.0/ext/new_allocator.h
F14;/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/model/inc/AWP.hpp
F13;/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/model/inc/AWPBus.hpp
F12;/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/model/inc/AWP_if.hpp
F11;/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/model/inc/common.hpp
F10;/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/model/inc/FAS.hpp
F9;/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/model/inc/Interconnect.hpp
F8;/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/model/inc/QUAD.hpp
F7;/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/model/inc/CNN_Layer_Accel.hpp
F6;/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/model/src/AWP.cpp
F5;/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/model/src/AWPBus.cpp
F4;/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/model/src/FAS.cpp
F3;/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/model/src/Interconnect.cpp
F2;/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/model/src/QUAD.cpp
F1;/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/model/src/CNN_Layer_Accel.cpp
F0;/home/mdl/izo5011/IkennaWorkSpace/cnn_layer_accel/model/inc/mem_mng.hpp


T61;<pointer>;11;0;8;8;0;0;<NONE>

M60;AWP;19;13312;9096;9096;0;0;AWP.dbs;F14;L26
B0;sc_core::sc_module;256;0;<NONE>;M34
P0;clk;12;288;AWP.dbs;T43;F14;L30
P0;init_soc;2097156;536;AWP.dbs;T3;F14;L31
X0;tar_soc;131072;1024;AWP.dbs;T37;F14;L32
C0;bus;1;2336;AWP.dbs;M59;F14;L33
C0;quad[0];524321;8808;AWP.dbs;M51;F14;L36
C0;quad[1];524321;8816;AWP.dbs;M51;F14;L36
C0;quad[2];524321;8824;AWP.dbs;M51;F14;L36
C0;quad[3];524321;8832;AWP.dbs;M51;F14;L36
V0;m_mem_mng;0;8840;AWP.dbs;T41;F14;L105
V0;m_trans;0;8864;AWP.dbs;T38;F14;L106
V0;m_AWP_id;0;9032;AWP.dbs;T42;F14;L107
V0;m_FAS_id;0;9036;AWP.dbs;T42;F14;L108
V0;m_num_trans_in_prog;0;9040;AWP.dbs;T42;F14;L109
V0;m_next_req_id;0;9044;AWP.dbs;T42;F14;L110
V0;m_QUADs_cfgd_arr;0;9048;AWP.dbs;T14;F14;L111
V0;m_num_QUADs_cfgd;0;9088;AWP.dbs;T42;F14;L112
N0;b_transport;(<unnamed><unnamed>,);AWP.dbs;F6;L129
N0;send_complete;();AWP.dbs;F6;L84
N0;request_process;(<unnamed>);AWP.dbs;F6;L49
N0;bus_arbitrate;();AWP.dbs;F6;L19
N0;~AWP;();AWP.dbs;F6;L10
N0;AWP;(sc_core::sc_module_name);CNN_Layer_Accel.dbs;F14;L44

M59;AWPBus;19;16790528;6472;6472;0;0;AWP.dbs;F13;L12
B0;sc_core::sc_module;256;0;<NONE>;M34
B0;AWP_if;256;288;AWP.dbs;T58;F12;L0
P0;clk;12;296;AWP.dbs;T43;F13;L15
V0;m_req_arr;0;544;AWP.dbs;T56;F13;L32
V0;m_QUAD_complt_arr;0;6432;AWP.dbs;T14;F13;L33
N0;b_transaction;(<unnamed>accel_cmd_t,<unnamed>,);AWPBus.dbs;F5;L14
N0;~AWPBus;();AWPBus.dbs;F5;L8
N0;AWPBus;(sc_core::sc_module_name);CNN_Layer_Accel.dbs;F13;L18

T58;AWP_if;0;16778496;8;8;0;0;AWP.dbs;F12;L8
N0;b_transaction;(<unnamed>accel_cmd_t,<unnamed>,);<NONE>

T57;Accel_Trans;0;8192;736;736;0;0;AWP.dbs;F11;L69
V0;accel_cmd;0;0;AWP.dbs;T44;F11;L73
V0;num_output_col_cfg;0;4;AWP.dbs;T42;F11;L74
V0;num_output_rows_cfg;0;8;AWP.dbs;T42;F11;L75
V0;num_kernels_cfg;0;12;AWP.dbs;T42;F11;L76
V0;num_1x1_kernels_cfg;0;16;AWP.dbs;T42;F11;L77
V0;master_QUAD_cfg;0;20;AWP.dbs;T43;F11;L78
V0;cascade_cfg;0;21;AWP.dbs;T43;F11;L79
V0;num_expd_input_cols_cfg;0;24;AWP.dbs;T42;F11;L80
V0;QUAD_id;0;28;AWP.dbs;T42;F11;L81
V0;num_QUADS_cfgd;0;32;AWP.dbs;T42;F11;L82
V0;AWP_id;0;36;AWP.dbs;T42;F11;L83
V0;FAS_id;0;40;AWP.dbs;T42;F11;L84
V0;res_pkt_size;0;44;AWP.dbs;T42;F11;L85
V0;conv_out_fmt0_cfg;0;48;AWP.dbs;T43;F11;L86
V0;padding_cfg;0;49;AWP.dbs;T43;F11;L87
V0;upsmaple_cfg;0;50;AWP.dbs;T43;F11;L88
V0;crpd_input_row_start_cfg;0;52;AWP.dbs;T42;F11;L89
V0;crpd_input_row_end_cfg;0;56;AWP.dbs;T42;F11;L90
V0;req_pending;0;60;AWP.dbs;T43;F11;L91
V0;ack;0;64;AWP.dbs;T38;F11;L92
V0;request;0;232;AWP.dbs;T38;F11;L93
V0;proceed;0;400;AWP.dbs;T38;F11;L94
V0;finished;0;568;AWP.dbs;T38;F11;L95
N0;Accel_Trans;();AWP.dbs;F11;L72

T56;Accel_Trans[8];20;8192;736;5888;8;0;<NONE>;T57

M55;CNN_Layer_Accel;19;13440;7384;7384;0;0;CNN_Layer_Accel.dbs;F7;L27
B0;sc_core::sc_module;256;0;<NONE>;M34
S0;clk;2;288;CNN_Layer_Accel.dbs;T40;F7;L31
X0;tar_soc;131072;1008;CNN_Layer_Accel.dbs;T37;F7;L32
C0;awp[0];524321;2320;CNN_Layer_Accel.dbs;M60;F7;L34
C0;awp[1];524321;2328;CNN_Layer_Accel.dbs;M60;F7;L34
C0;fas[0];524321;2336;CNN_Layer_Accel.dbs;M54;F7;L35
C0;FAS2AWE_bus;1;2344;CNN_Layer_Accel.dbs;M52;F7;L36
C0;AWE2FAS_bus;1;4808;CNN_Layer_Accel.dbs;M52;F7;L37
V0;m_FAS_complt_arr;0;7272;CNN_Layer_Accel.dbs;T14;F7;L81
V0;m_AWP_arr;0;7312;CNN_Layer_Accel.dbs;T12;F7;L82
V0;m_AWP_cfg_QUAD_arr;0;7336;CNN_Layer_Accel.dbs;T10;F7;L83
V0;m_AWP_num_QUADS_cfgd;0;7360;CNN_Layer_Accel.dbs;T11;F7;L84
N0;b_transport;(<unnamed><unnamed>,);CNN_Layer_Accel.dbs;F1;L114
N0;complt_process;(<unnamed>);CNN_Layer_Accel.dbs;F1;L102
N0;main_process;();CNN_Layer_Accel.dbs;F1;L24
N0;~CNN_Layer_Accel;();CNN_Layer_Accel.dbs;F1;L11
N0;CNN_Layer_Accel;(sc_core::sc_module_name);CNN_Layer_Accel.dbs;F7;L46

M54;FAS;19;12288;8512;8512;0;0;FAS.dbs;F10;L18
B0;sc_core::sc_module;256;0;<NONE>;M34
P0;clk;12;288;FAS.dbs;T43;F10;L48
P0;rout_init_soc;2097156;536;FAS.dbs;T2;F10;L49
X0;rout_tar_soc;131072;1024;FAS.dbs;T37;F10;L50
P0;sys_mem_init_soc;2097156;2336;FAS.dbs;T2;F10;L51
V0;m_mem_mng;0;2808;FAS.dbs;T41;F10;L121
V0;m_start;0;2832;FAS.dbs;T38;F10;L122
V0;m_start_ack;0;3000;FAS.dbs;T38;F10;L123
V0;m_complete;0;3168;FAS.dbs;T38;F10;L124
V0;m_complete_ack;0;3336;FAS.dbs;T38;F10;L125
V0;m_state;0;3504;FAS.dbs;T53;F10;L126
V0;m_AWP_complt_arr;0;3512;FAS.dbs;T14;F10;L127
V0;m_accel_trans_arr;0;3552;FAS.dbs;T61;F10;L128
V0;m_AWP_arr;0;3560;FAS.dbs;T14;F10;L129
V0;m_AWP_cfg_QUAD_arr;0;3600;FAS.dbs;T12;F10;L130
V0;m_AWP_num_QUAD_cfgd;0;3624;FAS.dbs;T13;F10;L131
V0;m_FAS_id;0;3648;FAS.dbs;T42;F10;L132
S0;m_partMap_fifo;2;3656;FAS.dbs;T36;F10;L133
V0;m_partMapFetchCount;0;4304;FAS.dbs;T42;F10;L134
V0;m_partMapFetchTotal;0;4308;FAS.dbs;T42;F10;L135
S0;m_inMap_fifo;2;4312;FAS.dbs;T36;F10;L136
V0;m_inMapFetchCount;0;4960;FAS.dbs;T42;F10;L137
V0;m_inMapFetchTotal;0;4964;FAS.dbs;T42;F10;L138
S0;m_krnl_1x1_fifo;2;4968;FAS.dbs;T36;F10;L139
V0;m_krnlFetchCount;0;5616;FAS.dbs;T42;F10;L140
V0;m_krnlFetchTotal;0;5620;FAS.dbs;T42;F10;L141
S0;m_resMap_fifo;2;5624;FAS.dbs;T36;F10;L142
V0;m_resMapFetchCount;0;6272;FAS.dbs;T42;F10;L143
V0;m_resMapFetchTotal;0;6276;FAS.dbs;T42;F10;L144
S0;m_outBuf_fifo;2;6280;FAS.dbs;T36;F10;L145
V0;m_first_iter_cfg;0;6928;FAS.dbs;T43;F10;L146
V0;m_conv_out_fmt0_cfg;0;6929;FAS.dbs;T43;F10;L147
V0;m_res_pkt_size;0;6932;FAS.dbs;T42;F10;L148
V0;m_last_iter_cfg;0;6936;FAS.dbs;T43;F10;L149
V0;m_res_layer_cfg;0;6937;FAS.dbs;T43;F10;L150
V0;m_process_count;0;6940;FAS.dbs;T42;F10;L151
V0;m_result_in;0;6944;FAS.dbs;T38;F10;L152
V0;m_job_fetch;0;7112;FAS.dbs;T38;F10;L153
V0;m_job_fetch_trans;0;7280;FAS.dbs;T57;F10;L154
V0;m_wr_outBuf;0;8016;FAS.dbs;T38;F10;L155
V0;m_sys_mem_bus_sema;0;8184;FAS.dbs;T33;F10;L156
N0;b_QUAD_job_start;(<unnamed><unnamed>,<unnamed>,);FAS.dbs;F4;L553
N0;b_QUAD_krnl_config;(<unnamed><unnamed>,<unnamed>,);FAS.dbs;F4;L528
N0;b_QUAD_pix_seq_config;(<unnamed><unnamed>,<unnamed>,);FAS.dbs;F4;L502
N0;b_QUAD_config;(<unnamed><unnamed>,<unnamed>,);FAS.dbs;F4;L461
N0;nb_fifo_trans;(FAS::fifo_sel_tFAS::fifo_cmd_t,<unnamed>,<unnamed>,);FAS.dbs;F4;L428
N0;nb_fifo_trans;(<unnamed>FAS::fifo_cmd_t,<unnamed>,<unnamed>,);FAS.dbs;F4;L403
N0;b_cfg_start_AWPs;();FAS.dbs;F4;L383
N0;b_cfg_FAS;(std::vector<bool, std::allocator<bool> >std::vector<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > >,std::vector<int, std::allocator<int> >,<unnamed>,<unnamed>,<unnamed>,<unnamed>,);FAS.dbs;F4;L331
N0;b_rout_soc_transport;(<unnamed><unnamed>,);FAS.dbs;F4;L349
N0;job_fetch_process;();FAS.dbs;F4;L299
N0;resMap_fetch_process;();FAS.dbs;F4;L265
N0;result_process;();FAS.dbs;F4;L245
N0;S_process;();FAS.dbs;F4;L213
N0;outBuf_wr_process;();FAS.dbs;F4;L201
N0;A_process;();FAS.dbs;F4;L105
N0;F_process;();FAS.dbs;F4;L73
N0;ctrl_process;();FAS.dbs;F4;L13
N0;~FAS;();FAS.dbs;F4;L9
N0;FAS;(sc_core::sc_module_name);FAS.dbs;F10;L64

T53;FAS::FAS_state_t;2;0;4;4;0;0;<NONE>
E0;ST_IDLE;0
E0;ST_CFG_START_AWP;1
E0;ST_ACTIVE;2
E0;ST_SEND_COMPLETE;3

M52;Interconnect;19;12288;2464;2464;0;0;Interconnect.dbs;F9;L17
B0;sc_core::sc_module;256;0;<NONE>;M34
P0;clk;12;288;Interconnect.dbs;T43;F9;L28
X0;tar_soc;131072;552;Interconnect.dbs;T37;F9;L29
P0;init_soc;2097156;1200;Interconnect.dbs;T4;F9;L30
S0;m_trans_fifo;2;1816;Interconnect.dbs;T35;F9;L61
N0;invalidate_direct_mem_ptr;(<unnamed>sc_dt::uint64,sc_dt::uint64,);Interconnect.dbs;F3;L68
N0;nb_transport_bw;(<unnamed><unnamed>,<unnamed>,<unnamed>,);Interconnect.dbs;F3;L62
N0;transport_dbg;(<unnamed><unnamed>,);Interconnect.dbs;F3;L56
N0;get_direct_mem_ptr;(<unnamed><unnamed>,<unnamed>,);Interconnect.dbs;F3;L50
N0;nb_transport_fw;(<unnamed><unnamed>,<unnamed>,<unnamed>,);Interconnect.dbs;F3;L44
N0;b_transport;(<unnamed><unnamed>,<unnamed>,);Interconnect.dbs;F3;L28
N0;run;();Interconnect.dbs;F3;L10
N0;Interconnect;(sc_core::sc_module_name);Interconnect.dbs;F9;L36

M51;QUAD;19;13312;1672;1672;0;0;AWP.dbs;F8;L11
B0;sc_core::sc_module;256;0;<NONE>;M34
P0;clk;12;288;AWP.dbs;T43;F8;L25
P0;bus;2097156;536;AWP.dbs;T39;F8;L26
V0;m_state;0;744;AWP.dbs;T50;F8;L73
V0;m_return_state;0;748;AWP.dbs;T50;F8;L74
V0;m_ex_start_time;0;752;AWP.dbs;T0;F8;L75
V0;m_pfb_count;0;760;AWP.dbs;T42;F8;L76
V0;m_num_ex_cycles;0;768;AWP.dbs;T0;F8;L77
V0;m_krnl_count;0;776;AWP.dbs;T42;F8;L78
V0;m_input_row;0;780;AWP.dbs;T42;F8;L79
V0;m_input_col;0;784;AWP.dbs;T42;F8;L80
V0;m_output_col;0;788;AWP.dbs;T42;F8;L81
V0;m_output_row;0;792;AWP.dbs;T42;F8;L82
V0;m_num_input_col_cfg;0;796;AWP.dbs;T42;F8;L83
V0;m_num_output_col_cfg;0;800;AWP.dbs;T42;F8;L84
V0;m_num_output_rows_cfg;0;804;AWP.dbs;T42;F8;L85
V0;m_num_kernels_cfg;0;808;AWP.dbs;T42;F8;L86
V0;m_master_QUAD_cfg;0;812;AWP.dbs;T43;F8;L87
V0;m_cascade_cfg;0;813;AWP.dbs;T43;F8;L88
V0;m_result_QUAD_cfg;0;814;AWP.dbs;T43;F8;L89
V0;m_num_expd_input_cols_cfg;0;816;AWP.dbs;T42;F8;L90
V0;m_conv_out_fmt0_cfg;0;820;AWP.dbs;T43;F8;L91
V0;m_padding_cfg;0;821;AWP.dbs;T43;F8;L92
V0;m_upsmaple_cfg;0;822;AWP.dbs;T43;F8;L93
V0;m_crpd_input_row_start_cfg;0;824;AWP.dbs;T42;F8;L94
V0;m_crpd_input_row_end_cfg;0;828;AWP.dbs;T42;F8;L95
V0;m_QUAD_id;0;832;AWP.dbs;T42;F8;L96
S0;m_res_fifo;2;840;AWP.dbs;T36;F8;L97
V0;m_last_res_wrtn;0;1488;AWP.dbs;T43;F8;L98
V0;m_pfb_wrtn;0;1496;AWP.dbs;T38;F8;L99
V0;m_start;0;1664;AWP.dbs;T42;F8;L100
N0;b_pfb_read;();QUAD.dbs;F2;L246
N0;b_pfb_write;();QUAD.dbs;F2;L236
N0;b_job_fetch;();QUAD.dbs;F2;L223
N0;b_job_start;();QUAD.dbs;F2;L206
N0;b_krnlCfg_write;();QUAD.dbs;F2;L199
N0;b_pxSeqCfg_write;();QUAD.dbs;F2;L193
N0;b_cfg_write;(<unnamed>);QUAD.dbs;F2;L172
N0;result_process;();QUAD.dbs;F2;L138
N0;conv_process;();QUAD.dbs;F2;L125
N0;ctrl_process_1;();QUAD.dbs;F2;L95
N0;ctrl_process_0;();QUAD.dbs;F2;L13
N0;~QUAD;();QUAD.dbs;F2;L7
N0;QUAD;(sc_core::sc_module_name);CNN_Layer_Accel.dbs;F8;L33

T50;QUAD::QUAD_state_t;2;0;4;4;0;0;<NONE>
E0;ST_IDLE;0
E0;ST_PRIM_BUFFER;1
E0;ST_WAIT_PFB_LOAD;2
E0;ST_ACTIVE;3
E0;ST_WAIT_LAST_RES_WRITE;4
E0;ST_SEND_COMPLETE;5

T49;__gnu_cxx::new_allocator<int>;0;1280;1;1;0;0;FAS.dbs;F15;L58
N0;destroy;(<unnamed>);<NONE>
N0;construct;(<unnamed><unnamed>,);<NONE>
N0;max_size;();FAS.dbs;F15;L113
N0;deallocate;(__gnu_cxx::new_allocator<int>::pointer__gnu_cxx::new_allocator<int>::size_type,);FAS.dbs;F15;L110
N0;allocate;(__gnu_cxx::new_allocator<int>::size_type<unnamed>,);FAS.dbs;F15;L99
N0;address;(__gnu_cxx::new_allocator<int>::const_reference);FAS.dbs;F15;L93
N0;address;(__gnu_cxx::new_allocator<int>::reference);FAS.dbs;F15;L89
N0;~new_allocator;();FAS.dbs;F15;L86
N0;new_allocator;(<unnamed>);FAS.dbs;F15;L81
N0;new_allocator;(<unnamed>);FAS.dbs;F15;L81
N0;new_allocator;();FAS.dbs;F15;L79

T48;__gnu_cxx::new_allocator<std::vector<bool, std::allocator<bool> > >;0;1280;1;1;0;0;FAS.dbs;F15;L58
N0;destroy;(<unnamed>);<NONE>
N0;construct;(<unnamed><unnamed>,);<NONE>
N0;max_size;();FAS.dbs;F15;L113
N0;deallocate;(__gnu_cxx::new_allocator<std::vector<bool, std::allocator<bool> > >::pointer__gnu_cxx::new_allocator<std::vector<bool, std::allocator<bool> > >::size_type,);FAS.dbs;F15;L110
N0;allocate;(__gnu_cxx::new_allocator<std::vector<bool, std::allocator<bool> > >::size_type<unnamed>,);FAS.dbs;F15;L99
N0;address;(__gnu_cxx::new_allocator<std::vector<bool, std::allocator<bool> > >::const_reference);FAS.dbs;F15;L93
N0;address;(__gnu_cxx::new_allocator<std::vector<bool, std::allocator<bool> > >::reference);FAS.dbs;F15;L89
N0;~new_allocator;();FAS.dbs;F15;L86
N0;new_allocator;(<unnamed>);FAS.dbs;F15;L81
N0;new_allocator;(<unnamed>);FAS.dbs;F15;L81
N0;new_allocator;();FAS.dbs;F15;L79

T47;__gnu_cxx::new_allocator<std::vector<int, std::allocator<int> > >;0;1280;1;1;0;0;CNN_Layer_Accel.dbs;F15;L58
N0;destroy;(<unnamed>);<NONE>
N0;construct;(<unnamed><unnamed>,);<NONE>
N0;max_size;();CNN_Layer_Accel.dbs;F15;L114
N0;deallocate;(__gnu_cxx::new_allocator<std::vector<int, std::allocator<int> > >::pointer__gnu_cxx::new_allocator<std::vector<int, std::allocator<int> > >::size_type,);CNN_Layer_Accel.dbs;F15;L110
N0;allocate;(__gnu_cxx::new_allocator<std::vector<int, std::allocator<int> > >::size_type<unnamed>,);CNN_Layer_Accel.dbs;F15;L100
N0;address;(__gnu_cxx::new_allocator<std::vector<int, std::allocator<int> > >::const_reference);CNN_Layer_Accel.dbs;F15;L93
N0;address;(__gnu_cxx::new_allocator<std::vector<int, std::allocator<int> > >::reference);CNN_Layer_Accel.dbs;F15;L89
N0;~new_allocator;();CNN_Layer_Accel.dbs;F15;L86
N0;new_allocator;(<unnamed>);CNN_Layer_Accel.dbs;F15;L81
N0;new_allocator;(<unnamed>);CNN_Layer_Accel.dbs;F15;L81
N0;new_allocator;();CNN_Layer_Accel.dbs;F15;L79

T46;__gnu_cxx::new_allocator<std::vector<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > > >;0;1280;1;1;0;0;CNN_Layer_Accel.dbs;F15;L58
N0;destroy;(<unnamed>);<NONE>
N0;construct;(<unnamed><unnamed>,);<NONE>
N0;max_size;();CNN_Layer_Accel.dbs;F15;L114
N0;deallocate;(__gnu_cxx::new_allocator<std::vector<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > > >::pointer__gnu_cxx::new_allocator<std::vector<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > > >::size_type,);CNN_Layer_Accel.dbs;F15;L110
N0;allocate;(__gnu_cxx::new_allocator<std::vector<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > > >::size_type<unnamed>,);CNN_Layer_Accel.dbs;F15;L100
N0;address;(__gnu_cxx::new_allocator<std::vector<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > > >::const_reference);CNN_Layer_Accel.dbs;F15;L93
N0;address;(__gnu_cxx::new_allocator<std::vector<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > > >::reference);CNN_Layer_Accel.dbs;F15;L89
N0;~new_allocator;();CNN_Layer_Accel.dbs;F15;L86
N0;new_allocator;(<unnamed>);CNN_Layer_Accel.dbs;F15;L81
N0;new_allocator;(<unnamed>);CNN_Layer_Accel.dbs;F15;L81
N0;new_allocator;();CNN_Layer_Accel.dbs;F15;L79

T45;__gnu_cxx::new_allocator<unsigned long>;0;1280;1;1;0;0;AWP.dbs;F15;L58
N0;destroy;(<unnamed>);<NONE>
N0;construct;(<unnamed><unnamed>,);<NONE>
N0;max_size;();AWP.dbs;F15;L113
N0;deallocate;(__gnu_cxx::new_allocator<unsigned long>::pointer__gnu_cxx::new_allocator<unsigned long>::size_type,);AWP.dbs;F15;L110
N0;allocate;(__gnu_cxx::new_allocator<unsigned long>::size_type<unnamed>,);AWP.dbs;F15;L99
N0;address;(__gnu_cxx::new_allocator<unsigned long>::const_reference);AWP.dbs;F15;L93
N0;address;(__gnu_cxx::new_allocator<unsigned long>::reference);AWP.dbs;F15;L89
N0;~new_allocator;();AWP.dbs;F15;L86
N0;new_allocator;(<unnamed>);AWP.dbs;F15;L81
N0;new_allocator;(<unnamed>);AWP.dbs;F15;L81
N0;new_allocator;();AWP.dbs;F15;L79

T44;accel_cmd_t;2;0;4;4;0;0;<NONE>
E0;ACCL_CMD_CFG_WRITE;0
E0;ACCL_CMD_PIX_SEQ_CFG_WRITE;1
E0;ACCL_CMD_KRL_CFG_WRITE;2
E0;ACCL_CMD_JOB_START;3
E0;ACCL_CMD_JOB_FETCH;4
E0;ACCL_CMD_RESULT_WRITE;5
E0;ACCL_CMD_JOB_COMPLETE;6

T43;bool;12;0;1;1;0;0;<NONE>

T42;int;5;0;4;4;0;0;<NONE>

T41;mem_mng;0;0;24;24;0;0;AWP.dbs;F0;L33
B0;tlm::tlm_mm_interface;256;0;AWP.dbs;T9;F20;L0
V0;free_list;0;8;AWP.dbs;T61;F0;L103
V0;empties;0;16;AWP.dbs;T61;F0;L104
N0;free;(<unnamed>);AWP.dbs;F0;L81
N0;allocate;();AWP.dbs;F0;L65
N0;~mem_mng;();AWP.dbs;F0;L40
N0;mem_mng;();AWP.dbs;F0;L37

T40;sc_clock;30;0;0;0;0;0;<NONE>

T39;sc_core::sc_port<AWP_if, 1, sc_core::SC_ONE_OR_MORE_BOUND>;23;0;208;0;0;0;AWP.dbs;F21;L454

T38;sc_event;26;4096;1;168;0;0;<NONE>

T37;sc_export;23;0;0;0;0;0;<NONE>

T36;sc_fifo<int>;25;0;0;648;0;0;<NONE>;T42

T35;sc_fifo<tlm::tlm_generic_payload *>;25;0;0;648;0;0;<NONE>;T61

M34;sc_module;19;4352;0;0;0;0;<NONE>

T33;sc_semaphore;5;4096;4;328;0;0;<NONE>

T32;std::_Bit_iterator;0;0;16;16;0;0;AWP.dbs;F18;L214
B0;std::_Bit_iterator_base;256;0;AWP.dbs;T31;F18;L0

T31;std::_Bit_iterator_base;0;256;16;16;0;0;AWP.dbs;F18;L136
B0;std::iterator<std::random_access_iterator_tag, bool, long, bool *, bool &>;256;0;AWP.dbs;T15;F17;L0
V0;_M_p;0;0;AWP.dbs;T61;F18;L139
V0;_M_offset;0;8;AWP.dbs;T1;F18;L140

T30;std::_Bvector_base<std::allocator<bool> >;0;256;40;40;0;0;AWP.dbs;F18;L411
V0;_M_impl;0;0;AWP.dbs;T29;F18;L488

T29;std::_Bvector_base<std::allocator<bool> >::_Bvector_impl;0;0;40;40;0;0;AWP.dbs;F18;L419
B0;std::allocator<unsigned long>;256;0;AWP.dbs;T16;F19;L0
V0;_M_start;0;0;AWP.dbs;T32;F18;L422
V0;_M_finish;0;16;AWP.dbs;T32;F18;L423
V0;_M_end_of_storage;0;32;AWP.dbs;T61;F18;L424
N0;_M_end_addr;();AWP.dbs;F18;L443
N0;_Bvector_impl;(<unnamed>);AWP.dbs;F18;L435
N0;_Bvector_impl;(<unnamed>);AWP.dbs;F18;L430
N0;_Bvector_impl;();AWP.dbs;F18;L428

T28;std::_Vector_base<int, std::allocator<int> >;0;256;24;24;0;0;FAS.dbs;F16;L72
V0;_M_impl;0;0;FAS.dbs;T27;F16;L164

T27;std::_Vector_base<int, std::allocator<int> >::_Vector_impl;0;0;24;24;0;0;FAS.dbs;F16;L79
B0;std::allocator<int>;256;0;FAS.dbs;T20;F19;L0
V0;_M_start;0;0;FAS.dbs;T61;F16;L82
V0;_M_finish;0;8;FAS.dbs;T61;F16;L83
V0;_M_end_of_storage;0;16;FAS.dbs;T61;F16;L84
N0;_M_swap_data;(<unnamed>);FAS.dbs;F16;L101
N0;_Vector_impl;(<unnamed>);FAS.dbs;F16;L95
N0;_Vector_impl;(<unnamed>);FAS.dbs;F16;L90
N0;_Vector_impl;();FAS.dbs;F16;L88

T26;std::_Vector_base<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > >;0;256;24;24;0;0;FAS.dbs;F16;L72
V0;_M_impl;0;0;FAS.dbs;T25;F16;L164

T25;std::_Vector_base<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > >::_Vector_impl;0;0;24;24;0;0;FAS.dbs;F16;L79
B0;std::allocator<std::vector<bool, std::allocator<bool> > >;256;0;FAS.dbs;T19;F19;L0
V0;_M_start;0;0;FAS.dbs;T61;F16;L82
V0;_M_finish;0;8;FAS.dbs;T61;F16;L83
V0;_M_end_of_storage;0;16;FAS.dbs;T61;F16;L84
N0;_M_swap_data;(<unnamed>);FAS.dbs;F16;L101
N0;_Vector_impl;(<unnamed>);FAS.dbs;F16;L95
N0;_Vector_impl;(<unnamed>);FAS.dbs;F16;L90
N0;_Vector_impl;();FAS.dbs;F16;L88

T24;std::_Vector_base<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >;0;256;24;24;0;0;CNN_Layer_Accel.dbs;F16;L72
V0;_M_impl;0;0;CNN_Layer_Accel.dbs;T23;F16;L164

T23;std::_Vector_base<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::_Vector_impl;0;0;24;24;0;0;CNN_Layer_Accel.dbs;F16;L79
B0;std::allocator<std::vector<int, std::allocator<int> > >;256;0;CNN_Layer_Accel.dbs;T18;F19;L0
V0;_M_start;0;0;CNN_Layer_Accel.dbs;T61;F16;L82
V0;_M_finish;0;8;CNN_Layer_Accel.dbs;T61;F16;L83
V0;_M_end_of_storage;0;16;CNN_Layer_Accel.dbs;T61;F16;L84
N0;_M_swap_data;(<unnamed>);CNN_Layer_Accel.dbs;F16;L101
N0;_Vector_impl;(<unnamed>);CNN_Layer_Accel.dbs;F16;L95
N0;_Vector_impl;(<unnamed>);CNN_Layer_Accel.dbs;F16;L92
N0;_Vector_impl;();CNN_Layer_Accel.dbs;F16;L86

T22;std::_Vector_base<std::vector<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > >, std::allocator<std::vector<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > > > >;0;256;24;24;0;0;CNN_Layer_Accel.dbs;F16;L72
V0;_M_impl;0;0;CNN_Layer_Accel.dbs;T21;F16;L164

T21;std::_Vector_base<std::vector<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > >, std::allocator<std::vector<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > > > >::_Vector_impl;0;0;24;24;0;0;CNN_Layer_Accel.dbs;F16;L79
B0;std::allocator<std::vector<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > > >;256;0;CNN_Layer_Accel.dbs;T17;F19;L0
V0;_M_start;0;0;CNN_Layer_Accel.dbs;T61;F16;L82
V0;_M_finish;0;8;CNN_Layer_Accel.dbs;T61;F16;L83
V0;_M_end_of_storage;0;16;CNN_Layer_Accel.dbs;T61;F16;L84
N0;_M_swap_data;(<unnamed>);CNN_Layer_Accel.dbs;F16;L101
N0;_Vector_impl;(<unnamed>);CNN_Layer_Accel.dbs;F16;L95
N0;_Vector_impl;(<unnamed>);CNN_Layer_Accel.dbs;F16;L92
N0;_Vector_impl;();CNN_Layer_Accel.dbs;F16;L86

T20;std::allocator<int>;0;256;1;1;0;0;FAS.dbs;F19;L92
B0;__gnu_cxx::new_allocator<int>;256;0;FAS.dbs;T49;F15;L0

T19;std::allocator<std::vector<bool, std::allocator<bool> > >;0;256;1;1;0;0;FAS.dbs;F19;L92
B0;__gnu_cxx::new_allocator<std::vector<bool, std::allocator<bool> > >;256;0;FAS.dbs;T48;F15;L0

T18;std::allocator<std::vector<int, std::allocator<int> > >;0;256;1;1;0;0;CNN_Layer_Accel.dbs;F19;L92
B0;__gnu_cxx::new_allocator<std::vector<int, std::allocator<int> > >;256;0;CNN_Layer_Accel.dbs;T47;F15;L0

T17;std::allocator<std::vector<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > > >;0;256;1;1;0;0;CNN_Layer_Accel.dbs;F19;L92
B0;__gnu_cxx::new_allocator<std::vector<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > > >;256;0;CNN_Layer_Accel.dbs;T46;F15;L0

T16;std::allocator<unsigned long>;0;256;1;1;0;0;AWP.dbs;F19;L92
B0;__gnu_cxx::new_allocator<unsigned long>;256;0;AWP.dbs;T45;F15;L0

T15;std::iterator<std::random_access_iterator_tag, bool, long, bool *, bool &>;0;256;1;1;0;0;AWP.dbs;F17;L118

T14;std::vector<bool, std::allocator<bool> >;0;0;40;40;0;0;AWP.dbs;F16;L214
B0;std::_Bvector_base<std::allocator<bool> >;256;0;AWP.dbs;T30;F18;L0

T13;std::vector<int, std::allocator<int> >;0;0;24;24;0;0;FAS.dbs;F16;L214
B0;std::_Vector_base<int, std::allocator<int> >;256;0;FAS.dbs;T28;F16;L0

T12;std::vector<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > >;0;0;24;24;0;0;FAS.dbs;F16;L214
B0;std::_Vector_base<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > >;256;0;FAS.dbs;T26;F16;L0

T11;std::vector<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >;0;0;24;24;0;0;CNN_Layer_Accel.dbs;F16;L214
B0;std::_Vector_base<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >;256;0;CNN_Layer_Accel.dbs;T24;F16;L0

T10;std::vector<std::vector<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > >, std::allocator<std::vector<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > > > >;0;0;24;24;0;0;CNN_Layer_Accel.dbs;F16;L214
B0;std::_Vector_base<std::vector<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > >, std::allocator<std::vector<std::vector<bool, std::allocator<bool> >, std::allocator<std::vector<bool, std::allocator<bool> > > > > >;256;0;CNN_Layer_Accel.dbs;T22;F16;L0

T9;tlm::tlm_mm_interface;0;1280;8;8;0;0;AWP.dbs;F20;L40
N0;~tlm_mm_interface;();AWP.dbs;F20;L43
N0;free;(<unnamed>);<NONE>

T8;tlm::tlm_req_rsp_channel<REQ, RSP, REQ_CHANNEL, RSP_CHANNEL>;22;69632;0;0;0;0;<NONE>

T7;tlm::tlm_slave_to_transport<REQ, RSP>;22;69632;0;0;0;0;<NONE>

T6;tlm::tlm_transport_channel<REQ, RSP, REQ_CHANNEL, RSP_CHANNEL>;22;69632;0;0;0;0;<NONE>

T5;tlm::tlm_transport_to_master<REQ, RSP>;22;69632;0;0;0;0;<NONE>

T4;tlm_utils::multi_passthrough_initiator_socket<Interconnect, 32U, tlm::tlm_base_protocol_types, 0U, sc_core::SC_ONE_OR_MORE_BOUND>;23;0;616;0;0;16;Interconnect.dbs;F23;L39

T3;tlm_utils::simple_initiator_socket<AWP, 32U, tlm::tlm_base_protocol_types>;23;0;472;0;0;16;AWP.dbs;F22;L139

T2;tlm_utils::simple_initiator_socket<FAS, 32U, tlm::tlm_base_protocol_types>;23;0;472;0;0;16;FAS.dbs;F22;L139

T1;unsigned int;5;512;4;4;0;0;<NONE>

T0;unsigned long;6;512;8;8;0;0;<NONE>

