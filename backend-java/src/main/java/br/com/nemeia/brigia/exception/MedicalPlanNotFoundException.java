package br.com.nemeia.brigia.exception;

public class MedicalPlanNotFoundException extends RuntimeException {
    public MedicalPlanNotFoundException(String message) {
        super(message);
    }
}
