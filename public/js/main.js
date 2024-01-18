$( document ).ready(function() {

    /**
     * Init del plugin validate
     */
    $("#frmVotacion").validate({
        rules: {
            txtNombreApellido:{
                required: true
            },
            txtAlias: {
                required: true,
                minlength: 5,
                aliasformat: "aliasformat"
            },
            txtRut:{
                required: true,
                rutformat: "rutformat"
            },
            txtEmail:{
                required: true,
                email: true
            },
            cboRegion: {
                required: true
            },
            cboComuna: {
                required: true
            },
            cboCandidato: {
                required: true
            }
        },
        messages: {
            txtNombreApellido: {
                required: "Debe ingresar su nombre y apellido", 
            },
            txtAlias: {
                required: "Debe ingresar un alias",
                minlength: "El alias debe tener al menos 5 caracteres" 
            },
            txtRut: {
                required: "Debe ingresar su RUT", 
            },
            txtEmail:{
                required: "Debe ingresar un email",
                email: "Debe ingresar un email v&aacute;lido"
            },
            cboRegion: {
                required: "Debe seleccionar una regi&oacute;n", 
            },
            cboComuna: {
                required: "Debe seleccionar una comuna", 
            },
            cboCandidato: {
                required: "Debe seleccionar un candidato", 
            }
        }
    });

    /**
     * Metodo que carga las Comunas - AJAX
     * @param {int} id_region ID de la Region
     */
    function comunasInit(id_region = 0) {

        $('#cboComuna').find('option').remove().end().append($('<option>', {
            value: '',
            text: '- Seleccione -'
        }));

        if (id_region == 0)
            return;

        $.ajax({
            method: "GET",
            url: "/sistema-votacion-desis/ajax_handler.php" + (id_region > 0 ? "?id_region=" + id_region : ""),
            headers: {
                'controller': "comunas"
            }
        })
        .done(function(data) {
    
            const comunas_data = JSON.parse(data);

            for (i in comunas_data) {

                $('#cboComuna').append($('<option>', {
                    value: comunas_data[i].id_comuna,
                    text: comunas_data[i].comuna,
                }));

            }
        
        })
        .fail(function(jqXHR, textStatus ) {
            console.log( "Request failed: " + textStatus );
        });
    
    }

    /**
     * Metodo que carga las Regiones - AJAX
     */
    function regionesInit() {

        $.ajax({
            method: "GET",
            url: "/sistema-votacion-desis/ajax_handler.php",
            headers: {
                'controller': "regiones"
            }
        })
        .done(function(data) {

            const regiones_data = JSON.parse(data);

            $('#cboRegion').find('option').remove().end().append($('<option>', {
                value: '',
                text: '- Seleccione -'
            }));

            for (i in regiones_data) {

                $('#cboRegion').append($('<option>', {
                    value: regiones_data[i].id_region,
                    text: regiones_data[i].region,
                }));

            }

        })
        .fail(function(jqXHR, textStatus ) {
            console.log( "Request failed: " + textStatus );
        });

    }

    /**
     * Metodo que carga los Candidatos - AJAX
     */
    function candidatosInit() {

        $.ajax({
            method: "GET",
            url: "/sistema-votacion-desis/ajax_handler.php",
            headers: {
                'controller': "candidatos"
            }
        })
        .done(function(data) {

            const candidatos_data = JSON.parse(data);

            $('#cboCandidato').find('option').remove().end().append($('<option>', {
                value: '',
                text: '- Seleccione -'
            }));

            for (i in candidatos_data) {

                $('#cboCandidato').append($('<option>', {
                    value: candidatos_data[i].id_candidato,
                    text: candidatos_data[i].candidato,
                }));

            }

        })
        .fail(function(jqXHR, textStatus ) {
            console.log( "Request failed: " + textStatus );
        });

    }

    /**
     * Evento Change - Cargar Comunas relacionadas a la Region seleccionada
     */
    $("#cboRegion").on("change", function (e) {

        comunasInit($(this).val());
      
    });

     /**
     * Function para validar los checkboxes de "Entero" 
     */
     function validateChkEntero() {
        
        const checked = $( "input[name^='chkEntero_']:checked" ).length;

        if  (checked < 2){

            $("#chkEntero-error").text("Debe seleccionar al menos dos opciones");
            $("#chkEntero-error").show();
            return false;
       
        }

        $("#chkEntero-error").hide();
             
        return true;
    }
    
    /**
     * Evento Click - Validar checkboxes al cambiar su estado
     */
    $("input[name^='chkEntero_']").on("click", function name() {

        validateChkEntero();

    });

    /**
     * Envento Click - Validacion y envio del formulario por POST
     */
    $("#btnVotar").on("click", function (e) {

        e.preventDefault();

        // Validaciones separadas por seccion

        const frmValid = $("#frmVotacion").valid(); 
        const chkValid = validateChkEntero(); 
        
        // Enviar POST por AJAX
        if  (frmValid && chkValid) {

            submitVotacion();

        } 
        
    });

    /**
     * Function para enviar el formulario por AJAX
     */
    function submitVotacion() {
        
        $.ajax({
            method: "POST",
            url: "/sistema-votacion-desis/ajax_handler.php",
            headers: {
                'controller': "votaciones"
            },
            data: $("#frmVotacion").serializeArray()
        })
        .done(function(data) {

            const data_votacion = JSON.parse(data);

            if (data_votacion.estado == 1)
            {
                $.alert({
                    title: 'Votaci&oacute;n',
                    type: 'green',
                    content: 'Su votaci&oacute;n ha sido registrada correctamente',
                    ok: {
                        text: 'Aceptar',
                    }
                });

                limpiarFormulario();

            }
            else
            {
                $.alert({
                    title: 'Votaci&oacute;n',
                    type: 'red',
                    content: data_votacion.mensaje,
                    ok: {
                        text: 'Aceptar',
                    }
                });

            }

        })
        .fail(function(jqXHR, textStatus ) {
            console.log( "Request failed: " + textStatus );
        });

    }

    /**
     * Function para limpiar el estado del formulario
     */
    function limpiarFormulario() {
        
        $("#txtNombreApllido").val("");
        $("#txtAlias").val("");
        $("#txtRut").val("");
        $("#txtEmail").val("");
        $("#cboRegion").val("");
        comunasInit();
        $("#cboCandidato").val("");
        $("input[name^='chkEntero_']").prop("checked", false);
        
    }

    /**
     * Acciones iniciales sobre el formulario
     */
    regionesInit();
    candidatosInit();

    $("#txtNombreApellido").focus();
   
});