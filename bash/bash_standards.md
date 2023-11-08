# Bash scripting guidelines
---
This directory contains the principles, standards and policies that need to be followed during bash scripting.

## [General guidelines](guidelines/general_guidelines.sh)

## [Coding guidelines](guidelines/coding_guidelines.sh)

## Examples
[sample.sh](sample.sh)

## Common files
If you are sharing functions between scripts in the same domain, create a [_common.sh](_common.sh) file and source it in the beginning of your shell scripts.

	#!/bin/bash
	
	source ./_common.sh

A top level collection of functions in [_liferay_common.sh](_liferay_common.sh) is maintained in the [liferay/liferay-docker](https://github.com/liferay/liferay-docker) repository.
If it is included it copied to the local directory and updated manually if the upstream file changes.