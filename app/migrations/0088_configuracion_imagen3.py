# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2018-06-02 19:33
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0087_auto_20180527_2246'),
    ]

    operations = [
        migrations.AddField(
            model_name='configuracion',
            name='imagen3',
            field=models.FileField(blank=True, null=True, upload_to='static'),
        ),
    ]
