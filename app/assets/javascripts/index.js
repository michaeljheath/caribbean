/**
 * Created by michaelheath on 2016-06-05.
 */

document.addEventListener("turbolinks:load",function () {


    $(this).ajaxSend( function(event, jqXHR, ajaxInfo, data) {
        $("#modal-ajax-spinner").spin('large', '#fff');
        //$('#modal-ajax-spinner').modal("show");
    })

    $(this).ajaxComplete( function(event, jqXHR, ajaxInfo, data) {
        //$("#modal-ajax-spinner").modal("hide");
        $("#modal-ajax-spinner").spin(false);
    })

    $("#select_country").change(function () {
        $("#select_destination").prop("disabled", false);
        $.ajax({
            url: "/destinations/getDestinationsByCountry", // this will be routed
            type: 'GET',
            data: {
                country_id: $("#select_country").val()
            },
            async: true,
            dataType: "json",
            error: function(XMLHttpRequest, errorTextStatus, error){
                alert("Failed: "+ errorTextStatus+" ;"+error);
            },
            success: function(data){
                $("#select_destination").children().remove();
                $("#select_destination").append('<option value="0">Select Destination</option>');
                $.each(data, function (key,value){
                    $("#select_destination").append('<option value="'+ value[1] +'">'+ value[0] +'</option>')
                });
            }
        });

        $("#current_geo_id").val($("#select_country").val());
        $("#current_search_type").val("country");

        $("#search_form_country").submit();
    })
    
    $("#select_destination").change(function () {
        $("#select_location").prop("disabled", false);
        $.ajax({
            url: "/locations/getLocationsByDestination", // this will be routed
            type: 'GET',
            data: {
                destination_id: $("#select_destination").val()
            },
            async: true,
            dataType: "json",
            error: function(XMLHttpRequest, errorTextStatus, error){
                alert("Failed: "+ errorTextStatus+" ;"+error);
            },
            success: function(data){
                $("#select_location").children().remove();
                $("#select_location").append('<option value="0">Select Location</option>');
                $.each(data, function (key,value){
                    $("#select_location").append('<option value="'+ value[1] +'">'+ value[0] +'</option>')
                });
            }
        });
        $("#current_geo_id").val( $("#select_destination").val()) ;
        $("#current_search_type").val("destination");

        $("#search_form_destination").submit();
    })

    $("#select_location").change(function () {
        $("#current_geo_id").val( $("#select_location").val()) ;
        $("#current_search_type").val("location");

        $("#search_form_location").submit();
    })


    $('#hotel_name').autocomplete({
        serviceUrl: '/accommodations/autocomplete',
        transformResult: function(response) {
            return {
                suggestions: $.map($.parseJSON(response), function(dataItem) {
                    return { value: dataItem.value, data: dataItem.data };
                })
            };
        },
        onSelect: function (suggestion) {
            $('#hotel_id').val(suggestion.data);
            $('#hotel_name').val(suggestion.value);
            $('#search_form_hotel').submit();
        }
    });


});



