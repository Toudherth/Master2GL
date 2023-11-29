package com.example.demo.controller;

import java.io.IOException;


import exception.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entity.Student;
import com.example.demo.service.StudentService;


@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;
    // For logs log4j
    private static final Logger logger = LoggerFactory.getLogger(StudentController.class);

    /*public StudentController(StudentService studentService){
        this.studentService= studentService;
    }*/


    
    @PostMapping
    @RequestMapping("/save")
    @Transactional
    public Result saveStudent(@RequestBody Student students){
      return  studentService.saveStudent(students);

    }

  /*  @GetMapping(value = "/getall")
    public Iterable<Student> getStudents() {
        return studentService.listAll();
    }*/


    @GetMapping(value = "/getall")
    public Iterable<Student> getStudents() {
        Iterable<Student> students = studentService.listAll();
        return students;
    }


    @PutMapping(value = "/edit/{id}")
    private Student update(@RequestBody Student student, @PathVariable(name="id")String _id){
        student.set_id(_id);
        studentService.saveOrUpdate(student);
        return null;
    }

    @DeleteMapping("/delete/{id}")
    @Transactional
    public ResponseEntity<String> deleteStudent(@PathVariable("id") String _id) {

          return   studentService.deleteStudent(_id);

    }

    @RequestMapping("/{id}")
    private Student getStudent(@PathVariable(name = "id") String studentid){
        return studentService.getStudentById(studentid);
    }


    //TODO: Pour l'ajout d'une image

    // uploader une image
 /*   @PostMapping("/uploadimage/{studentId}")
    public ResponseEntity<String> uploadImage(@PathVariable String studentId, @RequestParam("file") MultipartFile file) {
        try {
            // Lisez le contenu de l'image en tant que tableau d'octets
            byte[] imageData = file.getBytes();

            // Appelez le service pour mettre à jour l'image de l'étudiant
            studentService.updateStudentImage(studentId, imageData);

            return ResponseEntity.ok("Image ajoutée avec succès");
        } catch (IOException e) {
            // Gérez les erreurs d'upload
            return ResponseEntity.status(500).body("Erreur lors de l'ajout de l'image : " + e.getMessage());
        }
    }
*/

}

