package com.example.demo;

import com.example.demo.entity.Student;
import com.example.demo.repository.StudentRepository;
import com.example.demo.service.StudentService;
import org.junit.jupiter.api.Test;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.List;

public class StudentServiceTest {

/*
    @Test
    public void testListAllNoStudents() {
        // Création d'un mock pour le repository
        StudentRepository studentRepositoryMock = mock(StudentRepository.class);
        when(studentRepositoryMock.findAll()).thenReturn(new ArrayList<>());

        // Création du service avec le mock du repository
        StudentService studentService = new StudentService(studentRepositoryMock);

        // Appel de la méthode du service
        Iterable<Student> result = studentService.listAll();

        // Vérification du résultat
        assertNotNull(result);
        assertFalse(result.iterator().hasNext()); // Aucun étudiant ne devrait être présent
    }

    @Test
    public void testListAllWithStudents() {
        // Création de données de test
        List<Student> mockStudents = new ArrayList<>();
        mockStudents.add(new Student("1", "John Doe", "123 Main St", "1234567890",null));
        mockStudents.add(new Student("2", "Jane Smith", "456 Oak St", "9876543210",null));

        // Création d'un mock pour le repository
        StudentRepository studentRepositoryMock = mock(StudentRepository.class);
        when(studentRepositoryMock.findAll()).thenReturn(mockStudents);
        System.out.println(studentRepositoryMock);

        // Création du service avec le mock du repository
        StudentService studentService = new StudentService(studentRepositoryMock);

        // Appel de la méthode du service
        Iterable<Student> result = studentService.listAll();

        // Vérification du résultat
        assertNotNull(result);
        assertTrue(result.iterator().hasNext()); // Des étudiants devraient être présents
        assertEquals(2, ((List<Student>) result).size()); // Vérifie le nombre d'étudiants
    }

 */
}
