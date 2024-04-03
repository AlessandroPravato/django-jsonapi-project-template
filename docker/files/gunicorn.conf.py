# import logging
# import os


# # django wsgi application to run
# wsgi_app = 'django_project.wsgi:application'
# # recommended number of gunicorn workers may be less than or equal to: 2–4 x $(NUM_CORES)
# # (keep in mind that this is the total number, considering even threads)
# # set workers (sub-processes)
# # workers = multiprocessing.cpu_count() + 1
# workers = int(os.environ.get('GUNICORN_WORKERS', 1))
# # to be used in case of sync workers mode (no threads)
# # workers = multiprocessing.cpu_count() * 2 + 1
# # set threads (by setting thread number the worker mode automatically switches to gthread)
# threads = int(os.environ.get('GUNICORN_THREADS', 1))
# # socket to bind
# bind = '0.0.0.0:8000'

# preload_app = True
# worker_class = 'eventlet'
# timeout = '600'
# worker_tmp_dir = "/dev/shm"

# # log configuration params
# logging_level = os.environ.get('LOGGING_LEVEL', 'DEBUG')
# logging_level_int = getattr(logging, logging_level, logging.INFO)

# # log confinguration
# logconfig_dict = {
#     "version": 1,
#     "disable_existing_loggers": False,
#     "loggers": {
#         "gunicorn.error": {
#             "level": logging_level_int,
#             "handlers": ["error_console"],
#             "propagate": False
#         },
#         "gunicorn.access": {
#             "level": logging_level_int,
#             "handlers": ["console"],
#             "propagate": False
#         }
#     },
#     "handlers": {
#         "console": {
#             "class": "logging.StreamHandler",
#             "formatter": "generic",
#             "stream": "ext://sys.stdout"
#         },
#         "error_console": {
#             "class": "logging.StreamHandler",
#             "formatter": "generic",
#             "stream": "ext://sys.stderr"
#         },
#     },
#     "formatters": {
#         "generic": {
#             "format": "[%(process)d] [%(levelname)s] %(message)s",
#             "class": "logging.Formatter"
#         }
#     }
# }
