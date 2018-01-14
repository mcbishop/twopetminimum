
function getPetInfo(evt) {
    console.log(evt);
    var pet_id = $(this).data('pet-id');
    console.log("Pet ID is", pet_id);

    $.get("/pet.json", {'pet_id':pet_id},
        function(results) {
            console.log("Made it! Results are", results);
            var pet_id = results.id;
            var pet_desc = results.description;
            console.log(pet_desc);
            
            $('#div_' + pet_id).html(pet_desc);
        });
}

function getShelterInfo(evt) {
      console.log(evt);
    var shelter_id = $(this).data('shelterId');
    console.log("Shelter ID is", shelter_id);

    $.get("/shelter.json", {'shelter_id':shelter_id},
        function(results) {
            console.log("Made it! Results are", results);
            var shelter_id = results.id;
            var name = results.name;
            var lat = results.latitude;
            var lng = results.longitude;
            var phone = results.phone;
            var email = results.email;
            console.log(email);
            
            $('#div_' + shelter_id).html(lat);
        });
}  

$('.shelter').click(getShelterInfo);

$('.button').click(getPetInfo);





