# -*- coding: utf-8 -*-
# Generated by Django 1.9.3 on 2018-09-09 21:22
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0143_auto_20180904_1854'),
    ]

    operations = [
        migrations.CreateModel(
            name='Sociacategoriaphoto',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('photo', models.FileField(blank=True, null=True, upload_to='static')),
                ('sociacategoria', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='app.Sociacategoria')),
            ],
            options={
                'verbose_name': 'Publicacion / Photos',
                'managed': True,
            },
        ),
        migrations.AlterField(
            model_name='campania',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2018, 9, 9, 16, 22, 19, 859845), null=True),
        ),
        migrations.AlterField(
            model_name='historiaclientesocias',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2018, 9, 9, 16, 22, 19, 954927), null=True),
        ),
        migrations.AlterField(
            model_name='promocodigo',
            name='fecha_creacion',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2018, 9, 9, 16, 22, 19, 856631), null=True),
        ),
        migrations.AlterField(
            model_name='sociacomentario',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2018, 9, 9, 16, 22, 19, 873263)),
        ),
        migrations.AlterField(
            model_name='traficosms',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2018, 9, 9, 16, 22, 19, 879706), null=True),
        ),
    ]
