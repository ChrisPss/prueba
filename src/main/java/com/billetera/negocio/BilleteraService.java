package com.billetera.negocio;

import java.util.ArrayList;
import java.util.List;

public class BilleteraService {
     



public List<String> registrar(String tipoTexto, double saldo, String montoTexto) {

        List<String> errores = new ArrayList<>();

        String tipo = limpiar(tipoTexto);

        // Validar tipo de movimiento
        if (tipo == null || tipo.isEmpty()) {
            errores.add("Debe seleccionar un tipo de movimiento.");
        }

        // Validar monto
        Double monto = aEn(montoTexto);

        if (monto == null) {
            errores.add("El monto debe ser numérico.");
        } else if (monto <= 0) {
            errores.add("El monto debe ser mayor que cero.");
        }

        // Validar saldo insuficiente para gastos
        if ("Gasto".equals(tipoTexto)
                && monto != null
                && monto > saldo) {

            errores.add("Saldo insuficiente para realizar el gasto.");
        }

        return errores;
    }

    private Double aEn(String texto) {

        try {

            if (texto == null || texto.trim().isEmpty()) {
                return null;
            }

            return Double.parseDouble(texto.trim());

        } catch (NumberFormatException e) {
            return null;
        }
    }

    private static String limpiar(String texto) {
        return texto == null ? "" : texto.trim();
    }
}
