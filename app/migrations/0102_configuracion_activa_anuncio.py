# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2018-06-27 04:35
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0101_publicidad_sexo'),
    ]

    operations = [
        migrations.AddField(
            model_name='configuracion',
            name='activa_anuncio',
            field=models.BooleanField(default=False),
        ),
    ]
