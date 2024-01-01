import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';

@Component({
  selector: 'app-student',
  templateUrl: './student.component.html',
  styleUrls: ['./student.component.css']
})
export class StudentComponent {



  StudentArray : any[] = [];


  studentname: string ="";
  studentadresse: string ="";
  mobile: Number =0;
 
  currentStudentID = "";


  constructor(private http: HttpClient )
  {
    this.getAllStudent();
 
  }

  register()
  {
  
    let bodyData = {
      "studentname" : this.studentname,
      "studentadresse" : this.studentadresse,
      "mobile" : this.mobile
    };
 
    this.http.post("http://localhost:8080/student/save",bodyData,{responseType: 'text'}).subscribe((resultData: any)=>
    {
        console.log(resultData);
        alert("Student Registered Successfully");
        this.getAllStudent();
 
        this.studentname = '';
        this.studentadresse = '';
        this.mobile  = 0;
    });
  }


  getAllStudent()
  {
    
    this.http.get("http://localhost:8080/student/getall")
  
    .subscribe((resultData: any)=>
    {
    
        console.log(resultData);
        this.StudentArray = resultData;
    });
  }


  setUpdate(data: any)
  {
   this.studentname = data.studentname;
   this.studentadresse = data.studentadresse;
   this.mobile = data.mobile;
   this.currentStudentID = data._id;
   
  }


 
  UpdateRecords()
  {
    let bodyData = {
     
      "studentname" : this.studentname,
      "studentadresse" : this.studentadresse,
      "mobile" : this.mobile
    };
    
    this.http.put("http://localhost:8080/student/edit"+ "/" + this.currentStudentID , bodyData,{responseType: 'text'}).subscribe((resultData: any)=>
    {
        console.log(resultData);
        alert("Student Registered Updateddd")
        this.getAllStudent();
 
        this.studentname = '';
        this.studentadresse = '';
        this.mobile  = 0;
    });
  }
 
  save()
  {
    if(this.currentStudentID == '')
    {
        this.register();
    }
      else
      {
       this.UpdateRecords();
      }      
 
  }

  setDelete(data: any)
  {
    
    
    this.http.delete("http://localhost:8080/student/delete"+ "/"+ data._id,{responseType: 'text'}).subscribe((resultData: any)=>
    {
        console.log(resultData);
        alert("Student Deletedddd")
        this.getAllStudent();
 
        this.studentname = '';
        this.studentadresse = '';
        this.mobile  = 0;
  
    });
 
  }
}
