<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi billetera Digital</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
   <div class="container py-5">
    <div class="row mb-4">
        <div class="col">
            <h2 class="fw-bold">Mi Billetera Digital</h2>
        </div>
        <div class="col-auto">
            <span class="badge bg-dark fs-4">JSP + Servlet + bootstrap </span>
        </div>
    </div>

    <div class="row">
        <!-- Saldo Disponible -->
        <div class="col-md-7 mb-4">
            <div class="card shadow-sm p-4 border-0">
                <h6 class="text-muted text-uppercase small fw-bold">Saldo Disponible</h6>
                <h1 class="display-5 fw-bold text-success">S/ <c:out value="${sessionScope.saldo}"/></h1>
                <p class="text-muted mb-0">Después de movimientos válidos</p>
            </div>
        </div>

        <!-- VALIDACIONES -->
        <div class="col-md-5 mb-4">
    <div class="card shadow-sm p-3 border-0 bg-white">

        <h6 class="text-danger fw-bold">Mensajes de Validación</h6>

        <c:if test="${not empty errores}">
            <c:forEach var="error" items="${errores}">
                <div class="alert alert-danger py-2 mb-2" role="alert">
                    ${error}
                </div>
            </c:forEach>
        </c:if>

        <c:if test="${empty errores}">
            <p class="text-muted small mb-0">
                Realiza una recarga o gasto de forma segura.
            </p>
        </c:if>

    </div>
</div>
    </div>

    <!-- FORMULARIOS Movimiento -->
    <div class="card shadow-sm p-4 border-0 mb-4">
        <h5 class="fw-bold mb-3">Nuevo movimiento</h5>
        <form action="billetera" method="POST" class="row g-3">
            <div class="col-md-6">
                <label for="tipo" class="form-label">Tipo</label>
                <select class="form-select" id="tipo" name="tipo" required>
                    <option value="" disabled selected>Recarga / Gasto</option>
                    <option value="Recarga">Recarga</option>
                    <option value="Gasto">Gasto</option>
                </select>
            </div>
            <div class="col-md-6">
                <label for="monto" class="form-label">Monto (S/)</label>
                <input type="number" step="0.01" class="form-control" id="monto" name="monto" placeholder="0.00" required>
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-primary px-4">Registrar movimiento</button>
            </div>
        </form>
    </div>

    <!-- Historial de Movimientos -->
    <div class="card shadow-sm p-4 border-0">
        <h5 class="fw-bold mb-3">Movimientos recientes</h5>
        <div class="table-responsive">
            <table class="table align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>Tipo</th>
                        <th>Monto (S/)</th>
                        <th>Orden</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="mov" items="${sessionScope.historial}" varStatus="status">
                        <tr>
                            <td>
                                <c:choose>
                                    <c:when test="${mov.tipo == 'Gasto'}">
                                        <span class="badge bg-danger px-3 py-2">Gasto</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-success px-3 py-2">Recarga</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${mov.tipo == 'Gasto'}">
                                        - S/ <c:out value="${mov.monto}"/>
                                    </c:when>
                                    <c:otherwise>
                                        + S/ <c:out value="${mov.monto}"/>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${status.index == 0}">Más reciente</c:when>
                                    <c:otherwise>Anterior</c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty sessionScope.historial}">
                        <tr>
                            <td colspan="3" class="text-center text-muted">Aún no hay movimientos registrados.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>