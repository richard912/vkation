vKation.directive('rcValidate', ['$parse', '$compile', function ($parse, $compile) {
        return{
            require: '^form',
            restrict: 'AE',
            scope: {
                form: '=',
                submitted: '='
            },
            link: function (scope, element, attrs, form) {
                form.$submitted = false;
                defaultErrorMessages = {
                    required: 'is required.',
                    minlength: 'is too short.',
                    maxlength: 'is too long.',
                    email: 'is not valid.',
                    pattern: 'does not match the expected pattern.',
                    number: 'is not a number.',
                    url: 'is not a valid URL.',
                    form: 'has errors.',
                    fallback: 'is invalid.',
                    unique: 'already exists',
                    comapre: 'and Password does not match'
                };
                element.on('submit', function (event) {
                    var inputs = element.find("input");
                    var selects = element.find("select");
                    // For Find errors field foucs
                    var firstInvalid = element[0].querySelector('.ng-invalid');
                    if (firstInvalid) {
                        firstInvalid.focus();
                    }
                    // Error Fields scroll
                    for (var p = 0; p < selects.length; p++) {
                        inputs.push(selects[p]);
                    }
                    var valid = true;


                    for (var i = 0; i < inputs.length; i++) {
                        if (inputs[i].attributes.name.nodeValue === 'startDate' || inputs[i].attributes.name.nodeValue === 'issueDate' || inputs[i].attributes.name.nodeValue === 'expiryDate') {

                        } else {
                            angular.element(inputs[i]).bind("change", function (e) {
                                var attributes = e.target.attributes;
                                if (attributes.getNamedItem('ng-model') != void 0 && attributes.getNamedItem('name') != void 0) {
                                    var field = form[attributes.name.value];
                                    if (field.$invalid == true) {

                                        e.target.className += 'errorss';
                                        var re = new RegExp('has-success', 'g');
                                        e.target.className = e.target.className.replace(re, 'errorss');
                                        valid = false;
                                    }
                                    else {
                                        e.target.className += 'has-success';
                                        var re = new RegExp('errorss', 'g');
                                        e.target.className = e.target.className.replace(re, 'has-success');
                                        var elem = angular.element(e.target)
                                        var sib = elem.siblings();
                                        if (sib.length > 0) {
                                            for (var p = 0; p < sib.length; p++) {
                                                elem[0].parentNode.removeChild(sib[p])
                                            }
                                        }
                                    }
                                }
                            });
                            angular.element(inputs[i]).bind("keyup", function (e) {
                                var attributes = e.target.attributes;
                                if (attributes.getNamedItem('ng-model') != void 0 && attributes.getNamedItem('name') != void 0) {
                                    var field = form[attributes.name.value];
                                    if (field.$invalid == true) {
                                        e.target.className += ' errorss';
                                        var re = new RegExp(' has-success', 'g');
                                        e.target.className = e.target.className.replace(re, 'errorss');
                                        valid = false;
                                    }
                                    else {
                                        e.target.className += 'has-success';
                                        var re = new RegExp('errorss', 'g');
                                        e.target.className = e.target.className.replace(re, 'has-success');
                                        var elem = angular.element(e.target)
                                        var sib = elem.siblings();
                                        if (sib.length > 0) {
                                            for (var p = 0; p < sib.length; p++) {
                                                elem[0].parentNode.removeChild(sib[p])
                                            }
                                        }
                                    }
                                }
                            });
                        }


                        var name = inputs[i].attributes.name;
                        var type = inputs[i].attributes;
                        var attributes = inputs[i].attributes;
                        var emailRegx = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
                        if (attributes.getNamedItem('ng-model') !== void 0 && attributes.getNamedItem('name') !== void 0) {
                            var field = form[attributes.name.value];
                            if (field && field.$invalid === true) {
                                var ele = angular.element(inputs[i]);
                                var error = defaultErrorMessages.form;
                                if (inputs[i].value === "" && name.ownerElement.required === true) {
                                    error = defaultErrorMessages.required;
                                }
                                else if (inputs[i].hasAttribute('ng-minlength') && inputs[i].value.length < inputs[i].getAttribute('ng-minlength')) {
                                    error = defaultErrorMessages.minlength;
                                }
                                else if (inputs[i].hasAttribute('ng-maxlength') && inputs[i].value.length > inputs[i].getAttribute('ng-maxlength')) {
                                    error = defaultErrorMessages.maxlength;
                                }
                                else if (inputs[i].attributes.type = "email" && !emailRegx.test(inputs[i].value)) {
                                    error = defaultErrorMessages.email;
                                }
                                else if (inputs[i].hasAttribute('is-unique')) {
                                    error = defaultErrorMessages.unique;
                                }
                                else if (inputs[i].hasAttribute('compare-to')) {
                                    error = defaultErrorMessages.comapre;
                                }
                                else {
                                    error = defaultErrorMessages.form;
                                }
                                ele.addClass('errorss');
                                ele.removeClass('has-success');
                                var niceName = name.value.charAt(0).toUpperCase() + name.value.slice(1);
                                niceName = niceName.replace(/_/g, " ");
                                var errorIcon = angular.element('<a class="fa fa-exclamation-triangle tooltip-custome tooltip-postn" id="error_' + i.toString() + '" tooltips="" tooltip-title="Error !!" tooltip-side="left" tooltip-content ="' + niceName + " " + error.toString() + '" ></a>');
                                if (ele.siblings().length === 0) {
                                    ele.parent().append(errorIcon);
                                    $compile(errorIcon)(scope);
                                }
                                else {
                                    ele.parent().append(errorIcon);
                                    $compile(errorIcon)(scope);
                                }
                                valid = false;
                            }
                            else {
                                var elem = angular.element(inputs[i])
                                elem.removeClass('errorss');
                                elem.addClass('has-success');
                            }
                        }
                    }
                });

            }
        };

    }]);