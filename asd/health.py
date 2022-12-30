import datetime
from flask import Flask,Blueprint,render_template,request,redirect,url_for,flash,session
from database import *
import uuid

health=Blueprint('health',__name__)

@health.route('/healthhome')
def healthhome():
    return render_template("healthhome.html")

@health.route('/viewprofile',methods=['get','post']) 
def viewprofile():
    data={}  
    qry="select * from healthteam where id='%s'"%(session['hid'])
    res=select(qry)
    data['r']=res
    if 'action' in request.args:
        action=request.args['action']
        id=request.args['id']
         
    else:
        action=None

    if action=='update':
        qry="select * from healthteam where id='%s'"%(id)
        res=select(qry)
        data['re']=res

    if 'Submit' in request.form:
        name=request.form['textfield']
        quali=request.form['textfield2']
        phone=request.form['textfield3']
        email=request.form['textfield4']
        qry="update healthteam set name='%s',Qualific='%s',phone='%s',email='%s'where id='%s'"%(name,quali,phone,email,id)
        update(qry)
        return redirect(url_for('health.viewprofile'))

    return render_template("viewprofile.html",data=data)  

@health.route('/viewappoinment',methods=['get','post']) 
def viewappoinment():
    data={}  
    qry="select *,appointment.id as app_id ,staff.id as staff_id from appointment inner join staff on appointment.staff_id=staff.id "
    res=select(qry)
    data['rr']=res 

    return render_template("view appoinment.html",data=data)
@health.route('/viewstaf',methods=['get','post']) 
def viewstaf():   
        data={} 
        id=request.args['id']
        session['appid']=app_id=request.args['app_id']
        qr="select * from staff where id='%s'"%(id)
        print(qr)
        res=select(qr)    
        data['rrr']=res
        return render_template("viewstaff.html",data=data)
@health.route('/addmeditation',methods=['get','post']) 
def addmeditation():
    data={}
    if 'Submit' in request.form:
        title=request.form['textfield']
        des=request.form['textfield2']
        qy="insert into meditation values(null,'%s','%s','%s')"%(session['appid'],title,des)
        res=insert(qy)
        data['add']=res
        return redirect(url_for('health.viewappoinment'))
    

    return render_template("addmeditation.html")



