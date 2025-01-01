#!/bin/bash
pacman -Syu && pacman -S \
    base-devel man-db \
    zip unzip cmatrix
