import datetime
from flask import Flask,Blueprint,render_template,request,redirect,url_for,flash
from database import *
import uuid

admin=Blueprint('admin',__name__)

@admin.route('/adminhome')
def adminhome():
    return render_template("adminhome.html")

@admin.route('/managedesignation',methods=['get','post'])
def managedesignation():
    data={}
    qry="select * from designation"
    res=select(qry)
    data['desig']=res
    if 'Submit2' in request.form:
        desig=request.form['textfield']
        qry="insert into designation values(null,'%s')"%(desig)
        insert(qry)
        return redirect(url_for('admin.managedesignation'))

    if 'action' in request.args:
        action=request.args['action']
        id=request.args['id']

    else:
        action=None

    if action=='delete':
        q="delete from designation where id='%s'"%(id)
        delete(q)
        return redirect(url_for('admin.managedesignation'))

    if action=='update':
        q="select * from designation where id='%s'"%(id)
        print(q)
        res=select(q)
        print(res)
        data['res']=res
    
    if 'edit' in request.form:
        a=request.form['textfield']
        print(a)
        q="update designation set designame='%s' where id='%s'"%(a,id)
        update(q)
        return redirect(url_for('admin.managedesignation'))



    return render_template("managedesignation.html",data=data)

@admin.route('/managestaff',methods=['get','post'])
def managestaff():
    data={}
    
 
    qry="select * from staff"
    res=select(qry)
    data['stf']=res
    q="select * from designation"
    data['res']=select(q)
    if 'Submit2' in request.form:
        fname=request.form['textfield']
        lname=request.form['textfield2']
        desi=request.form['select']
        gender=request.form['radiobutton']
        phone=request.form['textfield4']
        email=request.form['textfield5']
        dob=request.form['textfield6']
        username=request.form['textfield7']
        passwrd=request.form['textfield8']
        qry1="insert into login values(null,'%s','%s','staff')"%(username,passwrd)
        lid=insert(qry1)
        qry="insert into staff values(null,'%s','%s','%s','%s','%s','%s','%s','%s')"%(lid,desi,fname,lname,gender,dob,phone,email)
        insert(qry)
        print(desi)
        
        return redirect(url_for('admin.managestaff'))
    if 'action' in request.args:
        action=request.args['action']
        id=request.args['id']

    else:
        action=None

    if action=='delete':
        q="delete from staff where id='%s'"%(id)
        delete(q)
        return redirect(url_for('admin.managestaff'))

    if action=='update':
        q="select * from staff where id='%s'"%(id)
        print(q)
        res=select(q)
        print(res)
        data['res1']=res
    
    if 'edit' in request.form:
        fname=request.form['textfield']
        lname=request.form['textfield2']
        desi=request.form['select']
        gender=request.form['radiobutton']
        phone=request.form['textfield4']
        email=request.form['textfield5']
        dob=request.form['textfield6']
        
        q="update staff set firstname='%s',lastname='%s',desig_id='%s',gender='%s',phone='%s',email='%s',dob='%s' where id='%s'"%(fname,lname,desi,gender,phone,email,dob,id)
        update(q)
        return redirect(url_for('admin.managestaff'))

    return render_template("managestaff.html",data=data)

@admin.route('/managehealth',methods=['get','post'])
def managehealth():
    data={}
    qry="select * from healthteam"
    res=select(qry)
    data['hlth']=res
    if 'Submit2' in request.form:
        name=request.form['textfield']
        quali=request.form['textfield2']
        phone=request.form['textfield3']
        email=request.form['textfield4']
        username=request.form['textfield5']
        password=request.form['textfield6']
        qry1="insert into login values(null,'%s','%s','health')"%(username,password)
        hid=insert(qry1)
        qry="insert into healthteam values(null,'%s','%s','%s','%s','%s')"%(hid,name,quali,phone,email)
        insert(qry)
        return redirect(url_for('admin.managehealth'))

    if 'action' in request.args:
        action=request.args['action']
        id=request.args['id']

    else:
        action=None

    if action=='delete':
        q="delete from healthteam where id='%s'"%(id)
        delete(q)
        return redirect(url_for('admin.managehealth'))

    if action=='update':
        q="select * from healthteam where id='%s'"%(id)
        print(q)
        res=select(q)
        print(res)
        data['res1']=res
    
    if 'edit' in request.form:
        name=request.form['textfield']
        quali=request.form['textfield2']
        phone=request.form['textfield3']
        email=request.form['textfield4']
        
        
        q="update healthteam set name='%s',Qualific='%s',phone='%s',email='%s' where id='%s'"%(name,quali,phone,email,id)
        update(q)
        return redirect(url_for('admin.managehealth'))    


    return render_template("managehealthteam.html",data=data)
@admin.route('/sendnotification',methods=['get','post'])
def sendnotification():
    if 'Submit' in request.form:
        noti=request.form['textfield']

        qry="insert into notification values(null,'%s',now())"%(noti)
        insert(qry)
        flash("send Notification")
    return render_template("sendnotification.html")  
@admin.route('/viewattendance',methods=['get','post'])
def viewattendance():
    data={}
    
    qry="select * from attendance"
    res=select(qry)
    data['res']=res
    return render_template("view attendence.html",data=data)
@admin.route('/viewcomplaints',methods=['get','post'])
def viewcomplaints():
    data={}  
    qry="select * from complaints"
    res=select(qry)
    data['res']=res
    if 'action' in request.args:
        action=request.args['action']
        id=request.args['id']
    else:
        action=None
    if action=='reply':
        data['check']=0
    if 'Submit' in request.form:
        reply=request.form['textfield']

        q="update complaints set reply='%s' where id='%s'"%(reply,id)
        update(q)
        return redirect(url_for('admin.viewcomplaints'))
    return render_template("view complaints.html",data=data)





       


     