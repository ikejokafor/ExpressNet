#!/usr/bin/python3
import argparse
import csv


def parseArgs():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--cmd_option",
        default = "default",
        help = "cmd_option",
        type = str
    )
    return parser.parse_args()


def main(argv):
    totalMemMov = float(0)
    csvData = []
    csvFile = open("/mnt/c/IkennaWorkSpace/cnn_layer_accel/model/python/yolov3_stats.csv")
    csvreader = csv.reader(csvFile, delimiter = ',')
    next(csvreader)
    csvData = list(csvreader)
    csvFile.close()
    for i in range(len(csvData)):
        csvRow = csvData[i]
        totalMemMov = totalMemMov + float(csvRow[2]) + float(csvRow[3])
        if(csvRow[4] is not '-'):
            totalMemMov = totalMemMov + float(csvRow[4])

    newTotalMemMov = totalMemMov
    for i in range(len(csvData)):
        csvRow = csvData[i]
        csvRow_1 = None
        csvRow_2 = None
        if((i + 1) < len(csvData) - 1):
            csvRow_1 = csvData[i + 1]
        if((i + 2) < len(csvData) - 1):
            csvRow_2 = csvData[i + 2]
        if(csvRow_1 != None and csvRow_2 != None):
            if(csvRow[1] == "3x3" and csvRow_1[1] == "res" and csvRow_2[1] == "1x1"):
                newTotalMemMov = newTotalMemMov - 3.0 * float(csvRow[3]) + float(csvRow_2[4])
                i = i + 3
        elif(csvRow_1 != None):
            if(csvRow[1] == "3x3" and csvRow_1[1] == "1x1"):
                newTotalMemMov = newTotalMemMov - float(csvRow[3]) + float(csvRow_1[4])
                i = i + 2
            if(csvRow[1] == "3x3" and csvRow_1[1] == "res"):
                newTotalMemMov = newTotalMemMov - float(csvRow[3])
                i = i + 2

    print(totalMemMov)
    print(newTotalMemMov)

if __name__ == "__main__":
    argv = parseArgs()
    main(argv)
