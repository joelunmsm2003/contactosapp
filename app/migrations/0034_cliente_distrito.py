# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2017-12-08 14:47
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0033_cliente_direccion'),
    ]

    operations = [
        migrations.AddField(
            model_name='cliente',
            name='distrito',
            field=models.ForeignKey(blank=True, db_column='distrito', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='app.Distrito'),
        ),
    ]
