# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2018-06-12 17:04
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0088_configuracion_imagen3'),
    ]

    operations = [
        migrations.AddField(
            model_name='servicio',
            name='token',
            field=models.CharField(blank=True, max_length=10000, null=True),
        ),
    ]
