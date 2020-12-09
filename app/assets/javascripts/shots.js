document.addEventListener("turbolinks:load", function() {

	var Shots = {
		previewShot() {
			if (window.File && window.FileList && window.FileReader) {

				function handleFileSelect(evt) {
					evt.stopPropagation();
					evt.preventDefault();

					let files = evt.target.files || evt.dataTransfer.files; 
					// files is a FileList of File objects. List some properties.
					for (var i = 0, f; f = files[i]; i++) {

						// Only process image files.
						if (!f.type.match('image.*')) {
							continue;
						}
						const reader = new FileReader();

						// Closure to capture the file information.
						reader.onload = (function(theFile) {
							return function(e) {
								// Render thumbnail.
								let span = document.createElement('span');
								span.innerHTML = ['<img class="thumb" src="', e.target.result,
									'" title="', escape(theFile.name), '"/>'
								].join('');
								document.getElementById('list').insertBefore(span, null);
							};
						})(f);

						// Read in the image file as a data URL.
						reader.readAsDataURL(f);
					}
				}

				function handleDragOver(evt) {
					evt.stopPropagation();
					evt.preventDefault();
					evt.dataTransfer.dropEffect = 'copy'; // Explicitly show this is a copy.
				}

				// Setup the dnd listeners.
				// https://stackoverflow.com/questions/47515232/how-to-set-file-input-value-when-dropping-file-on-page
				const dropZone = document.getElementById('drop_zone');
				const target = document.documentElement;
				const fileInput = document.getElementById('shot_user_shot');
				const previewImage = document.getElementById('previewImage');
				const newShotForm = document.getElementById('new_shot');


				if (dropZone) {
					dropZone.addEventListener('dragover', handleDragOver, false);
					dropZone.addEventListener('drop', handleFileSelect, false);

					// Drop zone classes itself
					dropZone.addEventListener('dragover', (e) => {
						dropZone.classList.add('fire');
					}, false);

					dropZone.addEventListener('dragleave', (e) => {
						dropZone.classList.remove('fire');
					}, false);

					dropZone.addEventListener('drop', (e) => {
						e.preventDefault();
						dropZone.classList.remove('fire');
						fileInput.files = e.dataTransfer.files;
						// if on shot/id/edit hide preview image on drop
						if (previewImage) {
							previewImage.style.display = 'none';
						}
						// If on shots/new hide dropzone on drop
						if(newShotForm) {
							dropZone.style.display = 'none';
						}
					}, false);

					// Body specific 
					target.addEventListener('dragover', (e) => {
						e.preventDefault();
						dropZone.classList.add('dragging');
					}, false);

					// removes dragging class to body WHEN NOT dragging
					target.addEventListener('dragleave', (e) => {
						dropZone.classList.remove('dragging');
						dropZone.classList.remove('fire');
					}, false);
				}
			}
		},
		shotHover() {
			$('.shot').hover(function() {
				$(this).children('.shot-data').toggleClass('visible');
			});
		}

	};
	Shots.previewShot();
	Shots.shotHover();


});



  function myFunctionAvatar() {
    var x = document.getElementById("avatar");
    if (x.style.display === "none") {
      x.style.display = "block";
    } else {
      x.style.display = "none";
    }
  }
  // function changeTextAvatar(idElement) {
  //     var element = document.getElementById('element' + idElement);
  //     if (idElement === 1) {
  //         if (element.innerHTML === 'Profile Picture') element.innerHTML = '→ Profile Picture';
  //         else {
  //             element.innerHTML = 'Profile Picture';
  //         }
  //     }
  // }
  // function changeFont1() {
  //   var fon1 = document.getElementById("element1");
  //   if (fon1.className == "roman") {
  //     fon1.className = 'amatic';
  //   } else {
  //     fon1.className = 'roman';
  //   }
  // }

  //   function myFunctionProfile() {
  //     var y = document.getElementById("public-profile");
  //     if (y.style.display === "") {
  //       y.style.display = "block";
  //     } else {
  //       y.style.display = "";
  //     }
  //   }
  //   function changeTextProfile(idElement) {
  //       var element = document.getElementById('element' + idElement);
  //       if (idElement === 2) {
  //           if (element.innerHTML === '→ Public Profile') element.innerHTML = 'Public Profile';
  //           else {
  //               element.innerHTML = '→ Public Profile';
  //           }
  //       }
  //   }
  //   function changeFont2() {
  //     var fon2 = document.getElementById("element2");
  //     if (fon2.className == "amatic") {
  //       fon2.className = 'roman';
  //     } else {
  //       fon2.className = 'amatic';
  //     }
  //   }

  //     function myFunctionEmail() {
  //       var z = document.getElementById("email");
  //       if (z.style.display === "") {
  //         z.style.display = "block";
  //       } else {
  //         z.style.display = "";
  //       }
  //     }
  //     function changeTextEmail(idElement) {
  //         var element = document.getElementById('element' + idElement);
  //         if (idElement === 3) {
  //             if (element.innerHTML === '→Edit Email') element.innerHTML = 'Email';
  //             else {
  //                 element.innerHTML = '→Edit Email';
  //             }
  //         }
  //     }
  //     function changeFont3() {
  //       var fon3 = document.getElementById("element3");
  //       if (fon3.className == "amatic") {
  //         fon3.className = 'roman';
  //       } else {
  //         fon3.className = 'amatic';
  //       }
  //     }

  //       function myFunctionPassword() {
  //         var p = document.getElementById("password");
  //         if (p.style.display === "") {
  //           p.style.display = "block";
  //         } else {
  //           p.style.display = "";
  //         }
  //       }
  //       function changeTextPassword(idElement) {
  //           var element = document.getElementById('element' + idElement);
  //           if (idElement === 4) {
  //               if (element.innerHTML === '→Edit Password') element.innerHTML = 'Password';
  //               else {
  //                   element.innerHTML = '→Edit Password';
  //               }
  //           }
  //       }
  //       function changeFont4() {
  //         var fon4 = document.getElementById("element4");
  //         if (fon4.className == "amatic") {
  //           fon4.className = 'roman';
  //         } else {
  //           fon4.className = 'amatic';
  //         }
  //       }


     //upload size
     function validateFiles(inputFile) {
      var maxExceededMessage = "This file exceeds the maximum allowed file size (2 MB)";
      var extErrorMessage = "Only image file with extension: .jpg, .jpeg, .gif or .png is allowed";
      var allowedExtension = ["jpg", "jpeg", "gif", "png"];
    
      var extName;
      var maxFileSize = $(inputFile).data('max-file-size');
      var sizeExceeded = false;
      var extError = false;
    
      $.each(inputFile.files, function() {
        if (this.size && maxFileSize && this.size > parseInt(maxFileSize)) {sizeExceeded=true;};
        extName = this.name.split('.').pop();
        if ($.inArray(extName, allowedExtension) == -1) {extError=true;};
      });
      if (sizeExceeded) {
        window.alert(maxExceededMessage);
        $(inputFile).val('');
      };
    
      if (extError) {
        window.alert(extErrorMessage);
        $(inputFile).val('');
      };
    }

