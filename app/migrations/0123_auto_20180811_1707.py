# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2018-08-11 22:07
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0122_auto_20180811_1701'),
    ]

    operations = [
        migrations.AddField(
            model_name='promocodigo',
            name='fecha_compartir',
            field=models.DateTimeField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='promocodigo',
            name='fecha_creacion',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2018, 8, 11, 17, 7, 33, 588557), null=True),
        ),
        migrations.AlterField(
            model_name='traficosms',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2018, 8, 11, 17, 7, 33, 597079), null=True),
        ),
    ]
