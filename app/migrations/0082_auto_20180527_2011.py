# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2018-05-28 01:11
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0081_configuracion'),
    ]

    operations = [
        migrations.AddField(
            model_name='configuracion',
            name='imagen1',
            field=models.FileField(blank=True, null=True, upload_to='static'),
        ),
        migrations.AddField(
            model_name='configuracion',
            name='imagen2',
            field=models.FileField(blank=True, null=True, upload_to='static'),
        ),
    ]
