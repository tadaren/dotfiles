#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import numpy as np
import matplotlib.pyplot as plt

import sys
import subprocess
import time

def ping_plot(host):
    command = 'ping {} -c 1'
    command = command.format(host).split()
    
    fig, ax = plt.subplots(1, 1)
    x = np.arange(-50, 0, 1)
    y = [0 for i in range(50)]
    lines, = ax.plot(x, y)
    ax.set_ylim((0,10))

    while True:
        p = subprocess.Popen(command, stdout=subprocess.PIPE)
        out = p.communicate()
        print(out[0].decode('utf-8').split('\n')[1])
        try:
            result = out[0].decode('utf-8').split()[12].split('=')[1]
        except IndexError:
            result = 0

        try:
            result = float(result)
        except:
            result = 0

        x += 1
        y.append(result)
        y = y[1:]

        lines.set_data(x, y)

        ax.set_xlim((x.min(), x.max()))
        ax.set_ylim((0, max(y)*1.2))

        plt.pause(.2)

if __name__ == "__main__":
    ping_plot(sys.argv[1])
