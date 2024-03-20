<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Goldeneye</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
  </head>
  <div class="flex items-center justify-center">
    <body class="bg-gray-100 p-4">
    <form action="email" method="POST" class="w-full max-w-lg">
      <div class="flex flex-wrap -mx-3 mb-6 p-4">
      <h1 class="text-3xl font-serif p-4 text-left">Welcome to Goldeneye</h1>
        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0 ">
            <label for="name" class="block uppercase tracking-wide text-gray-700 text-xs font-serif mb-2">Name: </label>
            <input
              type="text"
              name="name"
              pattern="^[^\d\s]+$"
              placeholder="Enter your name..."
              class="appearance-none block w-full bg-gray-200 text-gray-700 border  rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white"
              requireds
            />
        </div>
        <div class="w-full md:w-1/2 px-3">
            <label for="surname" class="block uppercase tracking-wide text-gray-700 text-xs font-serif mb-2">Surname: </label>
            <input
              type="text"
              name="surname"
              pattern="^[^\d\s]+$"
              placeholder="Enter your surname..."
              class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
              required
            />
        </div>
          <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
              <div class="relative">
                  <label for="city" class="block uppercase tracking-wide text-gray-700 text-xs font-serif mb-2">City:</label>
                  <select id="city" name="city" required class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500">
                      <option value="Milan">Milan</option>
                      <option value="Spain">Spain</option>
                      <option value="New York">New York</option>
                  </select>
              </div>
          </div>
          <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
              <div class="relative">
                  <label for="departament" class="block uppercase tracking-wide text-gray-700 text-xs font-serif mb-2">Departament:</label>
                  <select id="departament" name="departament" required class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500">
                  </select>
              </div>
          </div>
        <div class="w-full p-4">
           <button type="submit" class="w-full bg-blue-500 text-white font-serif py-2 px-4 rounded-md hover:bg-blue-600 focus:outline-none focus:bg-blue-600">
          Generate email</button>
        </div>
      </div>
    </form>
  </div>
  
    <script>
      const opt = document.getElementById("city");
      const dep = document.getElementById("departament");
      const nameInput = document.querySelector('input[name="name"]');
      const surnameInput = document.querySelector('input[name="surname"]');

    function validateNameSurname(input) {
        const validateNS = /^[a-zA-Z]+$/;
        return validateNS.test(input.value);
    }

function validateTextInput(input) {
  if (input.validity.customError) {
      input.setCustomValidity("");
    }else if (!input.validity.valid) {
    input.setCustomValidity("Please enter a valid text, numbers are not a valid option"); 
  } else if (!validateNameSurname(input)) {
    input.setCustomValidity("Please enter a valid name and surname"); 
  }
}

    nameInput.addEventListener("input", () => {
        validateTextInput(nameInput);
    });
    surnameInput.addEventListener("input", () => {
        validateTextInput(surnameInput);
    });

      function triggerChangeEvent(element) {
        const event = new Event("change", {
          bubbles: true,
          cancelable: true,
        });
        element.dispatchEvent(event);
      }
      
      opt.addEventListener("change", (event) => {
        dep.innerHTML = "";
        if (event.target.value == "Milan") {
          dep.innerHTML += `<option value="design">Design</option>`;
          dep.innerHTML += `<option value="business">Business</option>`;
          dep.innerHTML += `<option value="marketing">Marketing</option>`;
        }
        if (event.target.value == "Spain") {
          dep.innerHTML += `<option value="design">Research & development</option>`;
          dep.innerHTML += `<option value="business">Bisiness</option>`;
        }
        if (event.target.value == "New York") {
          dep.innerHTML += `<option value="business">Business</option>`;
          dep.innerHTML += `<option value="marketing">Adverising</option>`;
        }
      });

      triggerChangeEvent(opt);
    </script>
  </body>
</html>
