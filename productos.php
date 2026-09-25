<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="style.css">
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    
    <style>
        /* Agrega los estilos del carrusel aquí */
        .product-carousel {
            display: flex;
            flex-wrap: nowrap;
            overflow: auto;
            scroll-snap-type: x mandatory;
            scroll-behavior: smooth;
            gap: 20px; /* Espacio entre elementos del carrusel */
        }

        .product-item {
            flex: 0 0 auto;
            min-width: 300px; /* Ancho mínimo de cada elemento del carrusel */
            scroll-snap-align: start;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            padding: 10px;
        }

        .product-item img {
            max-width: 100%; /* Ajustar imagen al ancho del contenedor */
        }
    </style>

    <title>AstroJewl</title>
    <link rel="icon" href="Imagenes/AJ logo2.png">
</head>

<body>
    <header class="py-3 bg-image-full" style="background-image: url('Imagenes/estrellas.png')">
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <a href=""
                        class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
                        <img src="Imagenes/AJ logo2.png" alt="" height="60">
                    </a>
                </div>
                <!-- Contenido de la columna derecha (col-10) -->
                <nav class="navbar col-10 d-flex align-items-center justify-content-end">
                    <ul class="nav text-white">
                        <li class="nav-item"><a href="index.html" class="nav-link text-white">Inicio</a></li>
                        <li class="nav-item"> <a href="login.html" class="nav-link text-white">Login</a></li>
                        <li class="nav-item"><a href="catalogo.html" class="nav-link text-white">Catalogo</a></li>
                        <li class="nav-item"><a href="carrito.html" class="nav-link text-white"><i class="bi bi-cart"></i> Carrito</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <?php
    // Incluir el archivo de conexión a la base de datos
    include 'connection.php';

    // Realizar la consulta a la base de datos (reemplaza "nombre_tabla" por el nombre real de tu tabla)
    $sql = "SELECT * FROM Producto";
    $result = $conn->query($sql);

    // Comprobar si hay registros
    if ($result->num_rows > 0) {
        // Inicio del carrusel de productos
        echo '<div class="owl-carousel product-carousel">';

        // Iterar sobre los registros con el bucle while
        while ($row = $result->fetch_assoc()) {
            echo '<div class="pb-5">';
            echo '<div class="product-item position-relative bg-light d-flex flex-column text-center align-items-center">'; // Agregado "align-items-center" para centrar verticalmente
            echo '<img src="' . $row["url_prod"] . '" style="width: 250px;" class="mx-auto">'; // Agregado "mx-auto" para centrar horizontalmente
            echo '<h6 class="text-uppercase">' . $row['nom_prod'] . '</h6>';
            echo '<h5 class="text-primary mb-0">$' . $row['costo_prod'] . '</h5>';
            echo '<div class="btn-action d-flex justify-content-center">';
            echo '<a class="btn btn-primary py-2 px-3" href="carrito.html"><i class="bi bi-cart"></i></a>';
            echo '<a class="btn btn-primary py-2 px-3" href="catalogo.html"><i class="bi bi-eye"></i></a>';
            echo '</div>';
            echo '</div>';
            echo '</div>';
        }

        // Fin del carrusel de productos
        echo '</div>';
    } else {
        echo "No hay registros en la base de datos.";
    }

    // Cerrar la conexión
    $conn->close();
    ?>

    <script>
        $(document).ready(function() {
            $(".product-carousel").owlCarousel({
                items: 3,  // Número de elementos visibles en el carrusel
                loop: true,  // Bucle infinito
                margin: 20,  // Espacio entre elementos
                nav: true,  // Flechas de navegación
                responsive: {
                    0: {
                        items: 1
                    },
                    768: {
                        items: 2
                    },
                    992: {
                        items: 3
                    }
                }
            });
        });
    </script>

</body>

<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; AstroJewls 2023</p>
    </div>
</footer>
</html>
