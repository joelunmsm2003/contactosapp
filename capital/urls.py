
from django.conf.urls import patterns, include, url

from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token
from app.views import *
from django.core.urlresolvers import reverse
from django.contrib import admin


admin.site.site_header = 'Comtactos'



urlpatterns = [
    
    url(r'^admin/reporte/$', 'app.views.reporte'),
    url(r'^admin/', admin.site.urls),
    url(r'^api-token-auth/', 'jwt_auth.views.obtain_jwt_token'),
    url(r'api-token-refresh/', refresh_jwt_token),
    url(r'^', admin.site.urls),
    url(r'^_subcategorias/', 'app.views._subcategorias'),
    
    url(r'^categoria/(\d+)', 'app.views.categoria'),
    url(r'^eliminaservicio/(\d+)', 'app.views.eliminaservicio'),
    url(r'^mitema/', 'app.views.mitema'),
    url(r'^finalizaservicio/(\d+)', Finalizaservicio.as_view()),

    url(r'^distrito/', 'app.views.distrito'),
    url(r'^subirfoto', 'app.views.subirfoto'),
    url(r'^mifoto', 'app.views.mifoto'),
    url(r'^subcategoria/(\d+)/(\d+)', 'app.views.subcategoria'),
    url(r'^recibetoken/', 'app.views.recibetoken'),
    url(r'^portadaphoto/(\d+)', 'app.views.portadaphoto'),
    url(r'^aceptaserviciocliente/(\d+)', Aceptarserviciocliente.as_view()),
    url(r'^pagarenefectivo/(\d+)', Pagarenefectivo.as_view()),
    url(r'^pagotulki/(\d+)', Pagotulki.as_view()),
    url(r'^pagoyape/(\d+)', Pagoyape.as_view()),
    url(r'^misfavoritos/', Misfavoritos.as_view()),


    url(r'^cancelaserviciocliente/(\d+)', Cancelaserviciocliente.as_view()),
    url(r'^cancelaserviciosocia', Cancelaserviciosocia.as_view()),
    url(r'^publicidad/', 'app.views.traepublicidad'),
    url(r'^buscasocia/(\d+)',  Buscasocia.as_view()),

    url(r'^listasocias/',  Listasocias.as_view()),
    url(r'^guardanotificacion/', Guardanotificacion.as_view()),
    url(r'^aceptarservicio/', Aceptarservicio.as_view()),
    url(r'^agregafavorito/(\d+)', Agregafavorito.as_view()),

    url(r'^miservicios/', Miservicios.as_view()),
    url(r'^mianuncios/', Mianuncios.as_view()),
    url(r'^publica/', Publica.as_view()),
    url(r'^miserviciossocias/(\d+)', Miserviciossocias.as_view()),
    url(r'^sacauser/', Sacauser.as_view()),
    url(r'^sacasocia/', Sacasocia.as_view()),
    url(r'^detalleservicio/(\d+)', Detalleservicio.as_view()),
    url(r'^detallecategoria/(\d+)', Detallecategoria.as_view()),
    url(r'^promo/(\w+)/(\d+)', Promopago.as_view()),


    url(r'^miperfil/', Miperfil.as_view()),

    url(r'^smsrecibidos', 'app.views.smsrecibidos'),
    url(r'^smsrecibidos/', 'app.views.smsrecibidos'),
    url(r'^prueba/', 'app.views.prueba'),
    url(r'^registro/', 'app.views.registro'),
    url(r'^registro_v2/', 'app.views.registro_v2'),
    url(r'^validauser/', 'app.views.validauser'),
    url(r'^ultimoservicio/', Ultimoservicio.as_view()),
    url(r'^nuevasocia/', 'app.views.nuevasocia'),
    url(r'^envianotificacion/(\w+)/', 'app.views.envianotificacion'),
    url(r'^carganoti/(\w+)/(\d+)', 'app.views.carganoti'),
    url(r'^distrito', 'app.views.distrito'),
    url(r'^websocket', 'app.views.websocket'),
    url(r'^asignasocia', Asignasocia.as_view()),
    url(r'^creatoken/', Creatoken.as_view()),
    url(r'^guardadatosmovil/', Guardadatosmovil.as_view()),
    url(r'^obtienedistrito/', 'app.views.obtienedistrito'),
    url(r'^enviaemail/', 'app.views.enviaemail'),
    url(r'^infodistrito/', 'app.views.infodistrito'),
    url(r'^loginfacebook/', 'app.views.loginfacebook'),
    url(r'^asignanotificacion/', 'app.views.asignanotificacion'),
    url(r'^asignanotificacionsocia/', 'app.views.asignanotificacionsocia'),
    url(r'^buscasociatareaprogramada/', 'app.views.buscasociatareaprogramada'),
    url(r'^fotos/', 'app.views.fotos'),
    url(r'^personas/', 'app.views.personas'),
    url(r'^correccion/', 'app.views.correccion'),
    url(r'^panico/', Panico.as_view()),
    url(r'^actualizaperfil/', Actualizaperfil.as_view()),
    url(r'^linea/', Enlinea.as_view()),
    
    url(r'^activa_anuncio/', 'app.views.activa_anuncio'),
    url(r'^enviasms/(\w+)', 'app.views.enviasms'),

    #url(r'^enviatelefono/', 'app.views.enviatelefono'),
    
    #url(r'^vectorizacion/', 'app.views.vectorizacion'),

    


    
]
