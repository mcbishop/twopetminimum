
function getPetInfo(evt) {
    var pet_id = $(this).data('pet-id');
    $.get("/pet.json", {'pet_id':pet_id},
        function(results) {
            var pet_id = results.id;
            var pet_desc = results.description;            
            $('#div_' + pet_id).html(pet_desc);
        });
}
 // Below code is from combined Twilio tutorials, https://github.com/TwilioDevEd/clicktocall-flask/

// Execute JavaScript on page load
$(function() {
    // Intercept form submission and submit the form with ajax
    $('#contactForm').on('submit', function(e) {
        // Prevent submit event from bubbling and automatically
        // submitting the form
        e.preventDefault();

        // Call AJAX endpoint on the server to initialize the
        // text message
        $.ajax({
            url: '/text',
            method: 'POST',
            dataType: 'json',
            data: {
                phoneNumber: $('#phoneNumber').val(),
                photo_url: $('#photo_url').val()
            }
        }).done(function(data) {
            // The JSON sent back from the server will contain
            // a success message
            alert(data.message);
        }).fail(function(error) {
            alert(JSON.stringify(error));
        });
    });
});
// $('.button').click(getPetInfo);





