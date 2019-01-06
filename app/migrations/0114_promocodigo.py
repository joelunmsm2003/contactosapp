# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2018-08-02 02:43
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0113_servicio_dato_lugar'),
    ]

    operations = [
        migrations.CreateModel(
            name='Promocodigo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(blank=True, max_length=1000, null=True)),
                ('codigo', models.CharField(blank=True, max_length=1000, null=True)),
                ('descuento', models.IntegerField(blank=True, max_length=1000, null=True)),
                ('cliente', models.ForeignKey(blank=True, db_column='cliente', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='app.Cliente')),
                ('estado_compartir', models.ForeignKey(blank=True, db_column='estado_compartir', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='app.Estadocompartir')),
            ],
            options={
                'verbose_name': 'Promo codigos',
                'managed': True,
            },
        ),
    ]
