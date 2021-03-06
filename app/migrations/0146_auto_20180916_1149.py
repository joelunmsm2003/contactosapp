# -*- coding: utf-8 -*-
# Generated by Django 1.9.3 on 2018-09-16 16:49
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0145_auto_20180916_1149'),
    ]

    operations = [
        migrations.AlterField(
            model_name='campania',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2018, 9, 16, 11, 49, 30, 486225), null=True),
        ),
        migrations.AlterField(
            model_name='historiaclientesocias',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2018, 9, 16, 11, 49, 30, 527288), null=True),
        ),
        migrations.AlterField(
            model_name='promocodigo',
            name='fecha_creacion',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2018, 9, 16, 11, 49, 30, 476163), null=True),
        ),
        migrations.AlterField(
            model_name='sociacategoriaphoto',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2018, 9, 16, 11, 49, 30, 498015)),
        ),
        migrations.AlterField(
            model_name='sociacomentario',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2018, 9, 16, 11, 49, 30, 499348)),
        ),
        migrations.AlterField(
            model_name='traficosms',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2018, 9, 16, 11, 49, 30, 504463), null=True),
        ),
    ]
