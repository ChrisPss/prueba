package com.billetera.presentacion;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.billetera.modelo.Billetera;
import com.billetera.negocio.BilleteraService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
 

@WebServlet("/billetera")
public class BilleteraServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Double saldo = (Double) session.getAttribute("saldo");
        List<Billetera> historial =
                (List<Billetera>) session.getAttribute("historial");

        if (saldo == null) {
            saldo = 250.00;
            session.setAttribute("saldo", saldo);
        }

        if (historial == null) {
            historial = new ArrayList<>();
            session.setAttribute("historial", historial);
        }

        request.getRequestDispatcher("/WEB-INF/views/movimientos.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession session = request.getSession();

    Double saldo = (Double) session.getAttribute("saldo");
    List<Billetera> historial =
            (List<Billetera>) session.getAttribute("historial");

    if (saldo == null) {
        saldo = 250.00;
    }

    if (historial == null) {
        historial = new ArrayList<>();
    }

    String tipo = request.getParameter("tipo");
    String montoTexto = request.getParameter("monto");

    BilleteraService service = new BilleteraService();

    // OJO: el orden correcto de parámetros
    List<String> errores =
            service.registrar(tipo, saldo, montoTexto);

    if (errores.isEmpty()) {

        Double monto = Double.parseDouble(montoTexto);

        if ("Recarga".equals(tipo)) {
            saldo += monto;
        } else if ("Gasto".equals(tipo)) {
            saldo -= monto;
        }

        historial.add(0, new Billetera(tipo, monto, "",  saldo));

        session.setAttribute("saldo", saldo);
        session.setAttribute("historial", historial);
    }

        request.setAttribute("errores", errores);

        request.getRequestDispatcher("/WEB-INF/views/movimientos.jsp")
           .forward(request, response);
         }
    }


