# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2018-06-16 23:45
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0094_auto_20180616_1744'),
    ]

    operations = [
        migrations.AddField(
            model_name='cliente',
            name='fecha_inscripcion',
            field=models.DateTimeField(blank=True, null=True),
        ),
    ]
