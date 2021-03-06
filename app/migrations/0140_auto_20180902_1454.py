# -*- coding: utf-8 -*-
# Generated by Django 1.9.3 on 2018-09-02 19:54
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0139_auto_20180902_1033'),
    ]

    operations = [
        migrations.CreateModel(
            name='Sociacategoria',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('texperiencia', models.CharField(blank=True, max_length=1000, null=True)),
                ('comentario', models.TextField(blank=True, max_length=1000, null=True)),
                ('referencia', models.CharField(blank=True, max_length=1000, null=True)),
                ('validar', models.BooleanField(default=False)),
                ('descripcion', models.CharField(blank=True, max_length=1000, null=True)),
                ('titulo', models.CharField(blank=True, max_length=1000, null=True)),
                ('costo', models.IntegerField(blank=True, max_length=1000, null=True)),
                ('categoria', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='app.Categoria')),
                ('socia', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='app.Socia')),
            ],
            options={
                'verbose_name': 'Socia/Categoria',
                'managed': True,
            },
        ),
        migrations.AlterField(
            model_name='campania',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2018, 9, 2, 14, 54, 14, 806600), null=True),
        ),
        migrations.AlterField(
            model_name='promocodigo',
            name='fecha_creacion',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2018, 9, 2, 14, 54, 14, 803552), null=True),
        ),
        migrations.AlterField(
            model_name='sociacomentario',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2018, 9, 2, 14, 54, 14, 822143)),
        ),
        migrations.AlterField(
            model_name='traficosms',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2018, 9, 2, 14, 54, 14, 827356), null=True),
        ),
        migrations.AddField(
            model_name='sociasubcategoria',
            name='sociacategoria',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='app.Sociacategoria'),
        ),
    ]
