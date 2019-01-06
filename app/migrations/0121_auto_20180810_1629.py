# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2018-08-10 21:29
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0120_traficosms'),
    ]

    operations = [
        migrations.AddField(
            model_name='traficosms',
            name='referencia',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
        migrations.AlterField(
            model_name='traficosms',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2018, 8, 10, 16, 29, 26, 775390), null=True),
        ),
    ]
