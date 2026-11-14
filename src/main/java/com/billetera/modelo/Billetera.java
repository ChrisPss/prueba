package com.billetera.modelo;

 

public class Billetera {
    private  String tipo;
    private  double monto;
    private String orden;
    private Double saldo;
     



    public void setSaldo(Double saldo) {
        this.saldo = saldo;
    }



    public Double getSaldo() {
        return saldo;
    }



    public void setTipo(String tipo) {
        this.tipo = tipo;
    }



    public void setMonto(double monto) {
        this.monto = monto;
    }



    public void setOrden(String orden) {
        this.orden = orden;
    }



    public String getTipo() {
        return tipo;
    }



    public double getMonto() {
        return monto;
    }



    public String getOrden() {
        return orden;
    }

   public Billetera() {
        
    }

   
 public Billetera(String tipo, double monto, String orden, Double saldo) {
        this.tipo = tipo;
        this.monto = monto;
        this.orden = orden;
        this.saldo = saldo;
    }

}
