
PY?=python3.11

-include .env
export 

# --- Custom tasks, add your tasks below ---

.PHONY: run
run:
	. venv/bin/activate; $(PY) main.py $(params); deactivate

# --- Fixed tasks, DO NOT edit --

.PHONY: venv
venv:
	python3.11 -m venv venv --prompt 'venv'

.PHONY: touchfile
touchfile: requirements.txt
	test -d venv
	. venv/bin/activate; pip install -Ur requirements.txt; deactivate
	touch venv/touchfile

.PHONY: requirements
requirements: touchfile

.PHONY: freeze
freeze:
	. venv/bin/activate; $(PY) -m pip freeze > requirements.txt; deactivate

.PHONY: install
install: 
	. venv/bin/activate; $(PY) -m pip install $(package); deactivate

.PHONY: uninstall
uninstall: 
	. venv/bin/activate; $(PY) -m pip uninstall $(package); deactivate

.PHONY: list
list: 
	. venv/bin/activate; $(PY) -m pip list; deactivate

.PHONY: mypy
mypy:
	. venv/bin/activate; $(PY) -m mypy --strict .; deactivate

