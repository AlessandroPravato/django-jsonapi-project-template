### SETUP

build and start:
```
docker compose -f docker/compose.development.yaml up --build -d
```

Enter into the container:
```
docker exec -it django-project-django-1 bash
```

Check the control panel: http://localhost:8000/admin/

### POETRY

Add external library:
```
poetry add [LIB NAME]==[VERSION]
```

Remove external library:
```
poetry remove django-[LIB NAME]
```

### DJANGO COMMANDS

Create migrations:
```
poetry run python manage.py makemigrations
```

Apply migrations:
```
poetry run python manage.py migrate
```

Create admin user:
```
poetry run python manage.py createsuperuser
```

Create new app from template (first you have to create a folder inside /apps). For examples for an app "companies":
```
poetry run python manage.py startapp companies apps/companies --template=apps/core/app_template_single_model
```
or if you plan to have more than one model inside the app:
```
poetry run python manage.py startapp companies apps/companies --template=apps/core/app_template_multi_model
```
