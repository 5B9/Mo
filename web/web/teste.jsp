<%-- 
    Document   : teste
    Created on : 06/06/2019, 17:52:08
    Author     : Altai
--%>

    <body>
          <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Quicksearch e bootstrap</title>
 <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <div class="form-group input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
            <input name="consulta" id="txt_consulta" placeholder="Consultar" type="text" class="form-control">
        </div>

        <table id="tabela" class="table table-hover">
            <thead>
                <tr>
                    <th>Email</th>
                    <th>Id</th>
                    <th>Telefone</th>
                    <th>Url</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>joaosilva@gmail.com</th>
                    <td>66672</td>
                    <td>941-964-8535</td>
                    <td>http://gmail.com</td>
                </tr>
            
                <tr>
                    <th>eduardopaes@yahoo.net</th>
                    <td>35889</td>
                    <td>941-964-9543</td>
                    <td>http://yahoo.net</td>
                </tr>

                <tr>
                    <th>jabbathehutt@varl.com</th>
                    <td>66672</td>
                    <td>941-964-8535</td>
                    <td>http://varl.com</td>
                </tr>

                <tr>
                    <th>timhobby@flexomat.com</th>
                    <td>66672</td>
                    <td>941-964-8535</td>
                    <td>http://flexomat.com</td>
                </tr>

                <tr>
                    <th>larisalascaster@moda.info</th>
                    <td>66672</td>
                    <td>941-964-8535</td>
                    <td>http://moda.info</td>
                </tr>  

                <tr>
                    <th>jamestiberiuskirk@enterprise.us</th>
                    <td>66672</td>
                    <td>941-964-8535</td>
                    <td>http://enterprise.us</td>
                </tr>                               
            </tbody>
        </table>

        <script>
            $('input#txt_consulta').quicksearch('table#tabela tbody tr');
        </script>
    </body>
