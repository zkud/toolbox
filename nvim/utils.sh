#!/bin/bash

# $1 is nvim_path (absolute path)
copy_nvim_initial_config_to_home_cache() {
	rm -r "$1/home/"
	mkdir "$1/home/"
	cp -r "$1/home-init/.config/" "$1/home/"
}
