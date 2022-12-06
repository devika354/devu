
from django.urls import path
from p3app import views
urlpatterns=[
    path('',views.main,name='main'),
    path('admhome',views.admhome,name='admhome'),
    path('logins',views.logins,name='logins'),
    path('signup',views.signup,name='signup'),
    path('sign',views.sign,name='sign'),
    path('verifypharamacy',views.verifypharamacy,name='verifypharamacy'),
    path('accept/<int:id>',views.accept,name='accept'),
    path('reject/<int:id>',views.reject,name='reject'),
    path('pharhome',views.pharhome,name='pharhome'),
    path('userhome',views.userhome,name='userhome'),
    path('viewfeed',views.viewfeed,name='viewfeed'),
    path('logout',views.logout,name='logout'),
    path('addmangemedi',views.addmangemedi,name='addmangemedi'),
    path('addmedi',views.addmedi,name='addmedi'),
    path('medi',views.medi,name='medi'),
    path('edits/<int:id>',views.edits,name='edits'),
    path('editt',views.editt,name='editt'),
    path('delete/<int:id>',views.delete,name='delete'),
    path('viewcomp',views.viewcomp,name='viewcomp'),
    path('uregistration',views.uregistration,name='uregistration'),
    path('register',views.register,name='register'),
    path('viewpharmacy',views.viewpharmacy,name='viewpharmacy'),
    path('viewmedi',views.viewmedi,name='viewmedi'),
    path('orderd',views.orderd,name='orderd'),
    path('orders/<int:id>',views.orders,name='orders'),
    path('sendcomplaints',views.sendcomplaints,name='sendcomplaints'),
    path('complaintss',views.complaintss,name='complaintss'),
    path('sendfeedback',views.sendfeedback,name='sendfeedback'),
    path('feed',views.feed,name='feed'),
    path('viewvid',views.viewvid,name='viewvid'),
    path('orderstatus',views.orderstatus,name='orderstatus'),
    path('vieworder',views.vieworder,name='vieworder'),
    path('upvid',views.upvid,name='upvid'),
    path('videos',views.videos,name='videos'),
    path('sdreply/<int:cid>',views.sdreply,name='sdreply'),
    path('replys',views.replys,name='replys'),
    # path('acceptord/<int:id>',views.acceptord,name='acceptord'),
    # path('rejectord/<int:id>',views.rejectord,name='rejectord'),
    path('sdfile',views.sdfile,name='sdfile'),
    path('files',views.files,name='files'),
    path('viewfile',views.viewfile,name='viewfile'),


































]