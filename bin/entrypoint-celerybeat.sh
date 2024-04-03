#!/bin/bash

set -e

rm -f './celerybeat.pid'
poetry run celery -A django beat -l INFO