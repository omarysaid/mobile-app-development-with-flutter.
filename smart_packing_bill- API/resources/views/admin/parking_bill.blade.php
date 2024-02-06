<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

    <title>Parking Bills</title>
</head>

<body
style="background-color:grey"
>

<div id="header">
    <center>
        <h1>SMART PARKING</h1>
    </center>

</div>
    <div class="container">

        <div class="row">
            @foreach($parking_bill as $parkin)
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="{{ asset('storage/' . $parkin->car_image) }}" class="card-img-top" alt="Car Image">
                        <div class="card-body">
                            <h5 class="card-title">Location: {{ $parkin->location }}</h5>
                            <p class="card-text">Plate Number: {{ $parkin->plate_number }}</p>
                            <a class="fas fa-trash-alt" href={{"deleteItem/".$parkin->id}} role="button">Delete</a>

                            {{-- <i class="fas fa-trash-alt" style="cursor: pointer;" onclick="deleteItem('{{ $parkin->id }}')"></i> --}}

                        </div>
                    </div>
                </div>
            @endforeach
        </div>

        <!-- Pagination Links -->
        <div class="row">
            <div class="col-md-12">
                {{ $parking_bill->links() }}
            </div>
        </div>
    </div>

    <!-- Bootstrap JS (optional) -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script>
         function deleteItem(itemId) {
    if (confirm('Are you sure you want to delete this item?')) {
      // Perform an asynchronous request (e.g., using fetch or AJAX) to delete the item
      fetch(`/delete-item/${itemId}`, {
        method: 'DELETE',
      })
      .then(response => response.json())
      .then(data => {
        if (data.success) {
          // Refresh the page or update the UI as needed
          location.reload(); // For simplicity, reloading the page
        } else {
          alert('Failed to delete the item.');
        }
      })
      .catch(error => {
        console.error('Error deleting item:', error);
        alert('An error occurred while deleting the item.');
      });
    }
  }
    </script>
</body>
<STYle>
    #header{
        background: blue;
        margin:top;
    }
</STYle>
</html>
