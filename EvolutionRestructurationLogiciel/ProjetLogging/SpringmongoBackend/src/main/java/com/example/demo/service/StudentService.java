package com.example.demo.service;

import exception.EntityNotFoundException;
import exception.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Student;
import com.example.demo.repository.StudentRepository;

import java.util.List;
import java.util.Optional;
import java.util.logging.LogManager;

@Service
public class StudentService {
    
    @Autowired
    private StudentRepository studentRepository;
    private List<Student> students;

    private static final Logger logger = LoggerFactory.getLogger("Student");

    public StudentService(StudentRepository studentRepositoryMock) {
    }


    public Result saveStudent(Student student) {
        if (student.getStudentname() != null && student.getStudentadresse() != null ) {
            if(! students.contains(student)){
                logger.info("Ajouter un etudiant");
                try {
                    Student savedStudent = studentRepository.save(student);
                    // info =
                    logger.info("Étudiant sauvegardé avec succès : {}", savedStudent);
                    return new Result(true, "Étudiant sauvegardé avec succès");
                } catch (Exception e) {
                    logger.error("Erreur lors de la sauvegarde de l'étudiant", e);
                    return new Result(false, "Une erreur s'est produite lors de la sauvegarde de l'étudiant");
                }
            }else {System.out.println(" l'etudiant n'existe pas ");
            logger.error("L'etudiant existe ! ");}

        } else {
            logger.warn("Tentative d'ajout d'un étudiant avec des détails incomplets : {}", student);
            return new Result(false, "Les détails de l'étudiant ne sont pas complets. L'étudiant n'a pas été ajouté.");
        }
        return null;
    }

    public Result saveOrUpdate(Student student) {
        if (student.getStudentname() != null && student.getStudentadresse() != null && student.get_id() != null) {
            try {
                Student savedStudent = studentRepository.save(student);
                logger.info("Étudiant sauvegardé avec succès : {}", savedStudent);
                return new Result(true, "Étudiant sauvegardé avec succès");
            } catch (Exception e) {
                logger.error("Erreur lors de la sauvegarde de l'étudiant", e);
                return new Result(false, "Une erreur s'est produite lors de la sauvegarde de l'étudiant");
            }
        } else {
            logger.warn("Tentative d'ajout d'un étudiant avec des détails incomplets : {}", student);
            return new Result(false, "Les détails de l'étudiant ne sont pas complets. L'étudiant n'a pas été ajouté.");
        }
    }

    public Iterable<Student> listAll() {
        students = studentRepository.findAll();
        if (students.isEmpty()) {
            logger.info("Aucun étudiant trouvé.");
        } else {
            logger.info("Liste de tous les étudiants récupérée.");
        }
        return students;
    }

    public ResponseEntity<String> deleteStudent(String id) {
        try {
            Boolean verifie = studentRepository.existsById(id);
            if (verifie) {
                studentRepository.deleteById(id);
                logger.info("Étudiant avec l'id {} supprimé avec succès.", id);
                return new ResponseEntity<>("Suppression réussie", HttpStatus.OK);
            } else {
                logger.warn("Tentative de suppression d'un étudiant avec l'id {} non trouvé.", id);
                return new ResponseEntity<>("Étudiant non trouvé avec l'id : " + id, HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            logger.error("Erreur lors de la suppression de l'étudiant avec l'id " + id, e);
            return new ResponseEntity<>("Erreur lors de la suppression de l'étudiant", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    public Student getStudentById(String studentId) {
        logger.info("Récupération de l'étudiant avec l'ID : {}", studentId);

        Optional<Student> optionalStudent = studentRepository.findById(studentId);

        if (optionalStudent.isPresent()) {
            return optionalStudent.get();
        } else {
            logger.warn("Aucun étudiant trouvé avec l'ID : {}", studentId);
            return null;
        }
    }



    // TODO : pour l'ajout d'une image

    //uplead image
  /*  public void updateStudentImage(String studentId, byte[] imageData) {
        // Recherchez l'étudiant par son ID dans la base de données
        Student student = studentRepository.findById(studentId).orElse(null);

        if (student != null) {
            // Mettez à jour le champ d'image de l'étudiant avec les nouvelles données binaires
            student.setStudentImage(imageData);
            // Enregistrez l'étudiant mis à jour dans la base de données
            studentRepository.save(student);
        }
        // Gérez le cas où l'étudiant n'a pas été trouvé (peut-être renvoyer une exception ou un statut d'erreur)
    }*/

}
