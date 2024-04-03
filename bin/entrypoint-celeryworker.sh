#!/bin/bash

set -e

poetry run celery -A django worker -l INFO