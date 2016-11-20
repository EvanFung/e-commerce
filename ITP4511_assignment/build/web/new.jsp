
<!DOCTYPE html>
<html lang="en">
<head>

    <title>Electronic commerce</title>


    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.js"></script>
    <![endif]-->
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="js/register.js"></script>

    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/registration.css" rel="stylesheet">
</head>

<body>



<div class="container">

   <jsp:include page="header.jsp" />
    <hr>
    <div class="row-fluid">
        <div class="block">
            <div class="navbar navbar-inner block-header">
                <div class="muted pull-left">Order Placement</div>
                <div class="pull-right">Add Items to your order</div>
            </div>
            <div class="block-content collapse in">
                <div class="span12">
                    <div class="alert alert-info">Some message to show during the order placement </div>


                    <form class="form-horizontal">

                        <div class='root-template'>
                            <table class="table table-bordered">
                                <tr>
                                    <th>Remove</th>
                                    <th>File</th>
                                    <th>Layers</th>
                                    <th>Quantity</th>
                                    <th>Size</th>
                                    <th>Price</th>
                                </tr>
                                <tr>
                                    <td rowspan="3" style="vertical-align:middle;">
                                        <button class="btn btn-danger btn-small remove-template" type="button"><i class="icon-trash icon-white"></i> Remove</button>
                                    </td>
                                    <td colspan="2">
                                        <input type="file" name="file[]">
                                    </td>
                                    <td>
                                        <select name="layers[]" class="input-small"><option value="2">2</option><option value="4">4</option></select>
                                    </td>
                                    <td>
                                        <select name="quantity[]" class="input-medium"><option value="Protopack ±10">Protopack ±10</option><option value="10">10</option><option value="20">20</option><option value="30">30</option><option value="50">50</option><option value="100">100</option><option value="200">200</option><option value="500">500</option></select>
                                    </td>
                                    <td>
                                        <select name="size[]" class="input-medium"><option value="5x5">5x5 +$14</option><option value="10x10">10x10 +$25</option></select>
                                    </td>
                                    <td rowspan="3" style="vertical-align:middle;">
                                        <p class="text-center">
                                            $14
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Color</th>
                                    <th>Thickness</th>
                                    <th>Coating</th>
                                    <th>Stencil</th>
                                    <th>Size (cm)</th>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="color[]" class="input-small"><option value="Red">Red</option><option value="Yellow">Yellow</option><option value="Green">Green</option><option value="Blue">Blue</option><option value="Black">Black</option><option value="White">White</option></select>
                                    </td>
                                    <td>
                                        <select name="thickness[]" class="input-small"><option value="0.6mm">0.6mm</option><option value="0.8mm">0.8mm</option><option value="1.0mm">1.0mm</option><option value="1.2mm" selected="">1.2mm</option><option value="1.6mm">1.6mm</option><option value="2.0mm">2.0mm +$20</option></select>
                                    </td>
                                    <td>
                                        <select name="coating[]" class="input-small"><option value="HASL">HASL</option><option value="EING">EING +$15</option></select>
                                    </td>
                                    <td>
                                        <select name="stencil[]" class="input-small"><option value="None">None</option><option value="Steel">Steel +$25</option><option value="Frame">Frame +$45</option></select>
                                    </td>
                                    <td>
                                        <input type="text" name="size_h[]" disabled="" class="input-mini"> x <input type="text" name="size_w[]" disabled="" class="input-mini"> cm
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class='additional'></div>

                        <div class="row-fluid">
                            <div class="span12">
                                <button class="btn btn-primary add-new-product" type="button">Add</button>
                            </div>
                        </div>
                        <br />
                        <table class="table">
                            <tr>
                                <th>Processing</th>
                                <td>
                                    <select id="processing" name="processing"><option value="Normal">Normal 6-8days</option><option value="Rush">Rush 2-3days +$25 (2 layer) +$50 (4 layer)</option><option value="Emergency">Emergency 1-2days +$50 (2 layer) +$100 (4 layer)</option></select>
                                </td>
                                <td>$0</td>
                            </tr>
                            <tr>
                                <th>Shipping</th>
                                <td><select name="ShipCountry" id="ShipCountry"><option value="Afghanistan">Afghanistan</option><option value="Albania">Albania</option><option value="Algeria">Algeria</option><option value="American Samoa">American Samoa</option><option value="Andorra">Andorra</option><option value="Angola">Angola</option><option value="Anguilla">Anguilla</option><option value="Antarctica">Antarctica</option><option value="Antigua and Barbuda">Antigua and Barbuda</option><option value="Argentina">Argentina</option><option value="Armenia">Armenia</option><option value="Aruba">Aruba</option><option value="Australia">Australia</option><option value="Austria">Austria</option><option value="Azerbaijan">Azerbaijan</option><option value="Bahamas">Bahamas</option><option value="Bahrain">Bahrain</option><option value="Bangladesh">Bangladesh</option><option value="Barbados">Barbados</option><option value="Belarus">Belarus</option><option value="Belgium">Belgium</option><option value="Belize">Belize</option><option value="Benin">Benin</option><option value="Bermuda">Bermuda</option><option value="Bhutan">Bhutan</option><option value="Bolivia">Bolivia</option><option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option><option value="Botswana">Botswana</option><option value="Bouvet Island">Bouvet Island</option><option value="Brazil">Brazil</option><option value="British Indian Ocean Territory">British Indian Ocean Territory</option><option value="Brunei Darussalam">Brunei Darussalam</option><option value="Bulgaria">Bulgaria</option><option value="Burkina Faso">Burkina Faso</option><option value="Burundi">Burundi</option><option value="Cambodia">Cambodia</option><option value="Cameroon">Cameroon</option><option value="Canada">Canada</option><option value="Cape Verde">Cape Verde</option><option value="Cayman Islands">Cayman Islands</option><option value="Central African Republic">Central African Republic</option><option value="Chad">Chad</option><option value="Chile">Chile</option><option value="China">China</option><option value="Christmas Island">Christmas Island</option><option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option><option value="Colombia">Colombia</option><option value="Comoros">Comoros</option><option value="Congo">Congo</option><option value="Congo, the Democratic Republic of the">Congo, the Democratic Republic of the</option><option value="Cook Islands">Cook Islands</option><option value="Costa Rica">Costa Rica</option><option value="Cote D'Ivoire">Cote D'Ivoire</option><option value="Croatia">Croatia</option><option value="Cuba">Cuba</option><option value="Cyprus">Cyprus</option><option value="Czech Republic">Czech Republic</option><option value="Denmark">Denmark</option><option value="Djibouti">Djibouti</option><option value="Dominica">Dominica</option><option value="Dominican Republic">Dominican Republic</option><option value="Ecuador">Ecuador</option><option value="Egypt">Egypt</option><option value="El Salvador">El Salvador</option><option value="Equatorial Guinea">Equatorial Guinea</option><option value="Eritrea">Eritrea</option><option value="Estonia">Estonia</option><option value="Ethiopia">Ethiopia</option><option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option><option value="Faroe Islands">Faroe Islands</option><option value="Fiji">Fiji</option><option value="Finland">Finland</option><option value="France">France</option><option value="French Guiana">French Guiana</option><option value="French Polynesia">French Polynesia</option><option value="French Southern Territories">French Southern Territories</option><option value="Gabon">Gabon</option><option value="Gambia">Gambia</option><option value="Georgia">Georgia</option><option value="Germany">Germany</option><option value="Ghana">Ghana</option><option value="Gibraltar">Gibraltar</option><option value="Greece">Greece</option><option value="Greenland">Greenland</option><option value="Grenada">Grenada</option><option value="Guadeloupe">Guadeloupe</option><option value="Guam">Guam</option><option value="Guatemala">Guatemala</option><option value="Guinea">Guinea</option><option value="Guinea-Bissau">Guinea-Bissau</option><option value="Guyana">Guyana</option><option value="Haiti">Haiti</option><option value="Heard Island and Mcdonald Islands">Heard Island and Mcdonald Islands</option><option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option><option value="Honduras">Honduras</option><option value="Hong Kong">Hong Kong</option><option value="Hungary">Hungary</option><option value="Iceland">Iceland</option><option value="India">India</option><option value="Indonesia">Indonesia</option><option value="Iran, Islamic Republic of">Iran, Islamic Republic of</option><option value="Iraq">Iraq</option><option value="Ireland">Ireland</option><option value="Israel">Israel</option><option value="Italy">Italy</option><option value="Jamaica">Jamaica</option><option value="Japan">Japan</option><option value="Jordan">Jordan</option><option value="Kazakhstan">Kazakhstan</option><option value="Kenya">Kenya</option><option value="Kiribati">Kiribati</option><option value="Korea, Democratic People's Republic of">Korea, Democratic People's Republic of</option><option value="Korea, Republic of">Korea, Republic of</option><option value="Kuwait">Kuwait</option><option value="Kyrgyzstan">Kyrgyzstan</option><option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option><option value="Latvia">Latvia</option><option value="Lebanon">Lebanon</option><option value="Lesotho">Lesotho</option><option value="Liberia">Liberia</option><option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option><option value="Liechtenstein">Liechtenstein</option><option value="Lithuania">Lithuania</option><option value="Luxembourg">Luxembourg</option><option value="Macao">Macao</option><option value="Macedonia, the Former Yugoslav Republic of">Macedonia, the Former Yugoslav Republic of</option><option value="Madagascar">Madagascar</option><option value="Malawi">Malawi</option><option value="Malaysia">Malaysia</option><option value="Maldives">Maldives</option><option value="Mali">Mali</option><option value="Malta">Malta</option><option value="Marshall Islands">Marshall Islands</option><option value="Martinique">Martinique</option><option value="Mauritania">Mauritania</option><option value="Mauritius">Mauritius</option><option value="Mayotte">Mayotte</option><option value="Mexico">Mexico</option><option value="Micronesia, Federated States of">Micronesia, Federated States of</option><option value="Moldova, Republic of">Moldova, Republic of</option><option value="Monaco">Monaco</option><option value="Mongolia">Mongolia</option><option value="Montserrat">Montserrat</option><option value="Morocco">Morocco</option><option value="Mozambique">Mozambique</option><option value="Myanmar">Myanmar</option><option value="Namibia">Namibia</option><option value="Nauru">Nauru</option><option value="Nepal">Nepal</option><option value="Netherlands">Netherlands</option><option value="Netherlands Antilles">Netherlands Antilles</option><option value="New Caledonia">New Caledonia</option><option value="New Zealand">New Zealand</option><option value="Nicaragua">Nicaragua</option><option value="Niger">Niger</option><option value="Nigeria">Nigeria</option><option value="Niue">Niue</option><option value="Norfolk Island">Norfolk Island</option><option value="Northern Mariana Islands">Northern Mariana Islands</option><option value="Norway">Norway</option><option value="Oman">Oman</option><option value="Pakistan">Pakistan</option><option value="Palau">Palau</option><option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option><option value="Panama">Panama</option><option value="Papua New Guinea">Papua New Guinea</option><option value="Paraguay">Paraguay</option><option value="Peru">Peru</option><option value="Philippines">Philippines</option><option value="Pitcairn">Pitcairn</option><option value="Poland">Poland</option><option value="Portugal">Portugal</option><option value="Puerto Rico">Puerto Rico</option><option value="Qatar">Qatar</option><option value="Reunion">Reunion</option><option value="Romania">Romania</option><option value="Russian Federation">Russian Federation</option><option value="Rwanda">Rwanda</option><option value="Saint Helena">Saint Helena</option><option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option><option value="Saint Lucia">Saint Lucia</option><option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option><option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option><option value="Samoa">Samoa</option><option value="San Marino">San Marino</option><option value="Sao Tome and Principe">Sao Tome and Principe</option><option value="Saudi Arabia">Saudi Arabia</option><option value="Senegal">Senegal</option><option value="Serbia and Montenegro">Serbia and Montenegro</option><option value="Seychelles">Seychelles</option><option value="Sierra Leone">Sierra Leone</option><option value="Singapore">Singapore</option><option value="Slovakia">Slovakia</option><option value="Slovenia">Slovenia</option><option value="Solomon Islands">Solomon Islands</option><option value="Somalia">Somalia</option><option value="South Africa">South Africa</option><option value="South Georgia and the South Sandwich Islands">South Georgia and the South Sandwich Islands</option><option value="Spain">Spain</option><option value="Sri Lanka">Sri Lanka</option><option value="Sudan">Sudan</option><option value="Suriname">Suriname</option><option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option><option value="Swaziland">Swaziland</option><option value="Sweden">Sweden</option><option value="Switzerland">Switzerland</option><option value="Syrian Arab Republic">Syrian Arab Republic</option><option value="Taiwan, Province of China">Taiwan, Province of China</option><option value="Tajikistan">Tajikistan</option><option value="Tanzania, United Republic of">Tanzania, United Republic of</option><option value="Thailand">Thailand</option><option value="Timor-Leste">Timor-Leste</option><option value="Togo">Togo</option><option value="Tokelau">Tokelau</option><option value="Tonga">Tonga</option><option value="Trinidad and Tobago">Trinidad and Tobago</option><option value="Tunisia">Tunisia</option><option value="Turkey">Turkey</option><option value="Turkmenistan">Turkmenistan</option><option value="Turks and Caicos Islands">Turks and Caicos Islands</option><option value="Tuvalu">Tuvalu</option><option value="Uganda">Uganda</option><option value="Ukraine">Ukraine</option><option value="United Arab Emirates">United Arab Emirates</option><option value="United Kingdom">United Kingdom</option><option value="United States">United States</option><option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option><option value="Uruguay">Uruguay</option><option value="Uzbekistan">Uzbekistan</option><option value="Vanuatu">Vanuatu</option><option value="Venezuela">Venezuela</option><option value="Viet Nam">Viet Nam</option><option value="Virgin Islands, British">Virgin Islands, British</option><option value="Virgin Islands, U.s.">Virgin Islands, U.s.</option><option value="Wallis and Futuna">Wallis and Futuna</option><option value="Western Sahara">Western Sahara</option><option value="Yemen">Yemen</option><option value="Zambia">Zambia</option><option value="Zimbabwe">Zimbabwe</option></select> <select id="shipping" name="shipping" style="width:357px"><option value="free">Free - Hong Kong Post (1-8+ weeks)</option><option value="fast">Fast - DHL/FEDEX/UPS (3-5 days) +$32</option></select> <span id="shippingweight">Weight: 0.1kg</span></td>
                                <td>$0</td>
                            </tr>
                            <tr>
                                <th>Total</th>
                                <td></td>
                                <th>$14</th>
                            </tr>
                        </table>

                        <hr />
                        <div class="row-fluid">
                            <div class="span6">
                                <div class="row-fluid">
                                    <div class="span3">
                                        <label for="coupon">Coupon Code</label>
                                    </div>
                                    <div class="span6">
                                        <input type="text" id="coupon" value="" placeholder="Coupon Code" class="input-medium">
                                    </div>
                                </div>
                            </div>
                        </div>

                    </form>

                </div>
            </div>
        </div>
    </div>

    <div class="row-fluid">
        <div class="span6">
            <div class="block">
                <div class="navbar navbar-inner block-header">
                    <div class="muted pull-left">Shipping Information</div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <div class="alert alert-info"><span class="text-error">*</span> indicates required field</div>
                        <form class="form-horizontal">
                            <div class="control-group">
                                <label for="email">Email Address <span class="text-error">*</span></label>
                                <input type="text" id="email" value="" placeholder="Email Address">
                            </div>

                            <div class="control-group">
                                <label for="password">Password <span class="text-error">*</span></label>
                                <input type="text" id="password" value="" placeholder="Password">
                            </div>

                            <div class="control-group">
                                <label for="name">Name <span class="text-error">*</span></label>
                                <input type="text" id="name" value="" placeholder="Full Name">
                            </div>

                            <div class="control-group">
                                <label for="street">Street Address <span class="text-error">*</span></label>
                                <input type="text" id="street" value="" placeholder="Street Address">
                            </div>

                            <div class="control-group">
                                <label for="st2">Building/Apt/Suite</label>
                                <input type="text" id="st2" value="" placeholder="Building/Apt/Suite">
                            </div>

                            <div class="control-group">
                                <label for="email">City <span class="text-error">*</span></label>
                                <input type="text" id="email" value="" placeholder="City">
                            </div>

                            <div class="control-group">
                                <label for="state">State/Province <span class="text-error">*</span></label>
                                <input type="text" id="state" value="" placeholder="State">
                            </div>

                            <div class="control-group">
                                <label for="email">Postal Code <span class="text-error">*</span></label>
                                <input type="text" id="zip" value="" placeholder="Postal Code">
                            </div>

                            <div class="control-group">
                                <label for="phone">Country code and phone number <span class="text-error">*</span></label>
                                <div class="row-fluid">
                                    <div class="span3">
                                        <select name="Phonecode" id="Phonecode" class="input-small"><option value="AF +93">AF +93</option><option value="AL +355">AL +355</option><option value="DZ +213">DZ +213</option><option value="AS +1684">AS +1684</option><option value="AD +376">AD +376</option><option value="AO +244">AO +244</option><option value="AI +1264">AI +1264</option><option value="AQ +0">AQ +0</option><option value="AG +1268">AG +1268</option><option value="AR +54">AR +54</option><option value="AM +374">AM +374</option><option value="AW +297">AW +297</option><option value="AU +61">AU +61</option><option value="AT +43">AT +43</option><option value="AZ +994">AZ +994</option><option value="BS +1242">BS +1242</option><option value="BH +973">BH +973</option><option value="BD +880">BD +880</option><option value="BB +1246">BB +1246</option><option value="BY +375">BY +375</option><option value="BE +32">BE +32</option><option value="BZ +501">BZ +501</option><option value="BJ +229">BJ +229</option><option value="BM +1441">BM +1441</option><option value="BT +975">BT +975</option><option value="BO +591">BO +591</option><option value="BA +387">BA +387</option><option value="BW +267">BW +267</option><option value="BV +0">BV +0</option><option value="BR +55">BR +55</option><option value="IO +246">IO +246</option><option value="BN +673">BN +673</option><option value="BG +359">BG +359</option><option value="BF +226">BF +226</option><option value="BI +257">BI +257</option><option value="KH +855">KH +855</option><option value="CM +237">CM +237</option><option value="CA +1">CA +1</option><option value="CV +238">CV +238</option><option value="KY +1345">KY +1345</option><option value="CF +236">CF +236</option><option value="TD +235">TD +235</option><option value="CL +56">CL +56</option><option value="CN +86">CN +86</option><option value="CX +61">CX +61</option><option value="CC +672">CC +672</option><option value="CO +57">CO +57</option><option value="KM +269">KM +269</option><option value="CG +242">CG +242</option><option value="CD +242">CD +242</option><option value="CK +682">CK +682</option><option value="CR +506">CR +506</option><option value="CI +225">CI +225</option><option value="HR +385">HR +385</option><option value="CU +53">CU +53</option><option value="CY +357">CY +357</option><option value="CZ +420">CZ +420</option><option value="DK +45">DK +45</option><option value="DJ +253">DJ +253</option><option value="DM +1767">DM +1767</option><option value="DO +1809">DO +1809</option><option value="EC +593">EC +593</option><option value="EG +20">EG +20</option><option value="SV +503">SV +503</option><option value="GQ +240">GQ +240</option><option value="ER +291">ER +291</option><option value="EE +372">EE +372</option><option value="ET +251">ET +251</option><option value="FK +500">FK +500</option><option value="FO +298">FO +298</option><option value="FJ +679">FJ +679</option><option value="FI +358">FI +358</option><option value="FR +33">FR +33</option><option value="GF +594">GF +594</option><option value="PF +689">PF +689</option><option value="TF +0">TF +0</option><option value="GA +241">GA +241</option><option value="GM +220">GM +220</option><option value="GE +995">GE +995</option><option value="DE +49">DE +49</option><option value="GH +233">GH +233</option><option value="GI +350">GI +350</option><option value="GR +30">GR +30</option><option value="GL +299">GL +299</option><option value="GD +1473">GD +1473</option><option value="GP +590">GP +590</option><option value="GU +1671">GU +1671</option><option value="GT +502">GT +502</option><option value="GN +224">GN +224</option><option value="GW +245">GW +245</option><option value="GY +592">GY +592</option><option value="HT +509">HT +509</option><option value="HM +0">HM +0</option><option value="VA +39">VA +39</option><option value="HN +504">HN +504</option><option value="HK +852">HK +852</option><option value="HU +36">HU +36</option><option value="IS +354">IS +354</option><option value="IN +91">IN +91</option><option value="ID +62">ID +62</option><option value="IR +98">IR +98</option><option value="IQ +964">IQ +964</option><option value="IE +353">IE +353</option><option value="IL +972">IL +972</option><option value="IT +39">IT +39</option><option value="JM +1876">JM +1876</option><option value="JP +81">JP +81</option><option value="JO +962">JO +962</option><option value="KZ +7">KZ +7</option><option value="KE +254">KE +254</option><option value="KI +686">KI +686</option><option value="KP +850">KP +850</option><option value="KR +82">KR +82</option><option value="KW +965">KW +965</option><option value="KG +996">KG +996</option><option value="LA +856">LA +856</option><option value="LV +371">LV +371</option><option value="LB +961">LB +961</option><option value="LS +266">LS +266</option><option value="LR +231">LR +231</option><option value="LY +218">LY +218</option><option value="LI +423">LI +423</option><option value="LT +370">LT +370</option><option value="LU +352">LU +352</option><option value="MO +853">MO +853</option><option value="MK +389">MK +389</option><option value="MG +261">MG +261</option><option value="MW +265">MW +265</option><option value="MY +60">MY +60</option><option value="MV +960">MV +960</option><option value="ML +223">ML +223</option><option value="MT +356">MT +356</option><option value="MH +692">MH +692</option><option value="MQ +596">MQ +596</option><option value="MR +222">MR +222</option><option value="MU +230">MU +230</option><option value="YT +269">YT +269</option><option value="MX +52">MX +52</option><option value="FM +691">FM +691</option><option value="MD +373">MD +373</option><option value="MC +377">MC +377</option><option value="MN +976">MN +976</option><option value="MS +1664">MS +1664</option><option value="MA +212">MA +212</option><option value="MZ +258">MZ +258</option><option value="MM +95">MM +95</option><option value="NA +264">NA +264</option><option value="NR +674">NR +674</option><option value="NP +977">NP +977</option><option value="NL +31">NL +31</option><option value="AN +599">AN +599</option><option value="NC +687">NC +687</option><option value="NZ +64">NZ +64</option><option value="NI +505">NI +505</option><option value="NE +227">NE +227</option><option value="NG +234">NG +234</option><option value="NU +683">NU +683</option><option value="NF +672">NF +672</option><option value="MP +1670">MP +1670</option><option value="NO +47">NO +47</option><option value="OM +968">OM +968</option><option value="PK +92">PK +92</option><option value="PW +680">PW +680</option><option value="PS +970">PS +970</option><option value="PA +507">PA +507</option><option value="PG +675">PG +675</option><option value="PY +595">PY +595</option><option value="PE +51">PE +51</option><option value="PH +63">PH +63</option><option value="PN +0">PN +0</option><option value="PL +48">PL +48</option><option value="PT +351">PT +351</option><option value="PR +1787">PR +1787</option><option value="QA +974">QA +974</option><option value="RE +262">RE +262</option><option value="RO +40">RO +40</option><option value="RU +70">RU +70</option><option value="RW +250">RW +250</option><option value="SH +290">SH +290</option><option value="KN +1869">KN +1869</option><option value="LC +1758">LC +1758</option><option value="PM +508">PM +508</option><option value="VC +1784">VC +1784</option><option value="WS +684">WS +684</option><option value="SM +378">SM +378</option><option value="ST +239">ST +239</option><option value="SA +966">SA +966</option><option value="SN +221">SN +221</option><option value="CS +381">CS +381</option><option value="SC +248">SC +248</option><option value="SL +232">SL +232</option><option value="SG +65">SG +65</option><option value="SK +421">SK +421</option><option value="SI +386">SI +386</option><option value="SB +677">SB +677</option><option value="SO +252">SO +252</option><option value="ZA +27">ZA +27</option><option value="GS +0">GS +0</option><option value="ES +34">ES +34</option><option value="LK +94">LK +94</option><option value="SD +249">SD +249</option><option value="SR +597">SR +597</option><option value="SJ +47">SJ +47</option><option value="SZ +268">SZ +268</option><option value="SE +46">SE +46</option><option value="CH +41">CH +41</option><option value="SY +963">SY +963</option><option value="TW +886">TW +886</option><option value="TJ +992">TJ +992</option><option value="TZ +255">TZ +255</option><option value="TH +66">TH +66</option><option value="TL +670">TL +670</option><option value="TG +228">TG +228</option><option value="TK +690">TK +690</option><option value="TO +676">TO +676</option><option value="TT +1868">TT +1868</option><option value="TN +216">TN +216</option><option value="TR +90">TR +90</option><option value="TM +7370">TM +7370</option><option value="TC +1649">TC +1649</option><option value="TV +688">TV +688</option><option value="UG +256">UG +256</option><option value="UA +380">UA +380</option><option value="AE +971">AE +971</option><option value="GB +44">GB +44</option><option value="US +1">US +1</option><option value="UM +1">UM +1</option><option value="UY +598">UY +598</option><option value="UZ +998">UZ +998</option><option value="VU +678">VU +678</option><option value="VE +58">VE +58</option><option value="VN +84">VN +84</option><option value="VG +1284">VG +1284</option><option value="VI +1340">VI +1340</option><option value="WF +681">WF +681</option><option value="EH +212">EH +212</option><option value="YE +967">YE +967</option><option value="ZM +260">ZM +260</option><option value="ZW +263">ZW +263</option></select>
                                    </div>
                                    <div class="span7">
                                        <input type="text" id="phone" value="" placeholder="Phone Number" class="input-medium">
                                    </div>
                                </div>
                            </div>

                            <div class="control-group">
                                <label for="country">Country <span class="text-error">*</span></label>
                                <select name="country" id="country"><option value="Afghanistan">Afghanistan</option><option value="Albania">Albania</option><option value="Algeria">Algeria</option><option value="American Samoa">American Samoa</option><option value="Andorra">Andorra</option><option value="Angola">Angola</option><option value="Anguilla">Anguilla</option><option value="Antarctica">Antarctica</option><option value="Antigua and Barbuda">Antigua and Barbuda</option><option value="Argentina">Argentina</option><option value="Armenia">Armenia</option><option value="Aruba">Aruba</option><option value="Australia">Australia</option><option value="Austria">Austria</option><option value="Azerbaijan">Azerbaijan</option><option value="Bahamas">Bahamas</option><option value="Bahrain">Bahrain</option><option value="Bangladesh">Bangladesh</option><option value="Barbados">Barbados</option><option value="Belarus">Belarus</option><option value="Belgium">Belgium</option><option value="Belize">Belize</option><option value="Benin">Benin</option><option value="Bermuda">Bermuda</option><option value="Bhutan">Bhutan</option><option value="Bolivia">Bolivia</option><option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option><option value="Botswana">Botswana</option><option value="Bouvet Island">Bouvet Island</option><option value="Brazil">Brazil</option><option value="British Indian Ocean Territory">British Indian Ocean Territory</option><option value="Brunei Darussalam">Brunei Darussalam</option><option value="Bulgaria">Bulgaria</option><option value="Burkina Faso">Burkina Faso</option><option value="Burundi">Burundi</option><option value="Cambodia">Cambodia</option><option value="Cameroon">Cameroon</option><option value="Canada">Canada</option><option value="Cape Verde">Cape Verde</option><option value="Cayman Islands">Cayman Islands</option><option value="Central African Republic">Central African Republic</option><option value="Chad">Chad</option><option value="Chile">Chile</option><option value="China">China</option><option value="Christmas Island">Christmas Island</option><option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option><option value="Colombia">Colombia</option><option value="Comoros">Comoros</option><option value="Congo">Congo</option><option value="Congo, the Democratic Republic of the">Congo, the Democratic Republic of the</option><option value="Cook Islands">Cook Islands</option><option value="Costa Rica">Costa Rica</option><option value="Cote D'Ivoire">Cote D'Ivoire</option><option value="Croatia">Croatia</option><option value="Cuba">Cuba</option><option value="Cyprus">Cyprus</option><option value="Czech Republic">Czech Republic</option><option value="Denmark">Denmark</option><option value="Djibouti">Djibouti</option><option value="Dominica">Dominica</option><option value="Dominican Republic">Dominican Republic</option><option value="Ecuador">Ecuador</option><option value="Egypt">Egypt</option><option value="El Salvador">El Salvador</option><option value="Equatorial Guinea">Equatorial Guinea</option><option value="Eritrea">Eritrea</option><option value="Estonia">Estonia</option><option value="Ethiopia">Ethiopia</option><option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option><option value="Faroe Islands">Faroe Islands</option><option value="Fiji">Fiji</option><option value="Finland">Finland</option><option value="France">France</option><option value="French Guiana">French Guiana</option><option value="French Polynesia">French Polynesia</option><option value="French Southern Territories">French Southern Territories</option><option value="Gabon">Gabon</option><option value="Gambia">Gambia</option><option value="Georgia">Georgia</option><option value="Germany">Germany</option><option value="Ghana">Ghana</option><option value="Gibraltar">Gibraltar</option><option value="Greece">Greece</option><option value="Greenland">Greenland</option><option value="Grenada">Grenada</option><option value="Guadeloupe">Guadeloupe</option><option value="Guam">Guam</option><option value="Guatemala">Guatemala</option><option value="Guinea">Guinea</option><option value="Guinea-Bissau">Guinea-Bissau</option><option value="Guyana">Guyana</option><option value="Haiti">Haiti</option><option value="Heard Island and Mcdonald Islands">Heard Island and Mcdonald Islands</option><option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option><option value="Honduras">Honduras</option><option value="Hong Kong">Hong Kong</option><option value="Hungary">Hungary</option><option value="Iceland">Iceland</option><option value="India">India</option><option value="Indonesia">Indonesia</option><option value="Iran, Islamic Republic of">Iran, Islamic Republic of</option><option value="Iraq">Iraq</option><option value="Ireland">Ireland</option><option value="Israel">Israel</option><option value="Italy">Italy</option><option value="Jamaica">Jamaica</option><option value="Japan">Japan</option><option value="Jordan">Jordan</option><option value="Kazakhstan">Kazakhstan</option><option value="Kenya">Kenya</option><option value="Kiribati">Kiribati</option><option value="Korea, Democratic People's Republic of">Korea, Democratic People's Republic of</option><option value="Korea, Republic of">Korea, Republic of</option><option value="Kuwait">Kuwait</option><option value="Kyrgyzstan">Kyrgyzstan</option><option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option><option value="Latvia">Latvia</option><option value="Lebanon">Lebanon</option><option value="Lesotho">Lesotho</option><option value="Liberia">Liberia</option><option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option><option value="Liechtenstein">Liechtenstein</option><option value="Lithuania">Lithuania</option><option value="Luxembourg">Luxembourg</option><option value="Macao">Macao</option><option value="Macedonia, the Former Yugoslav Republic of">Macedonia, the Former Yugoslav Republic of</option><option value="Madagascar">Madagascar</option><option value="Malawi">Malawi</option><option value="Malaysia">Malaysia</option><option value="Maldives">Maldives</option><option value="Mali">Mali</option><option value="Malta">Malta</option><option value="Marshall Islands">Marshall Islands</option><option value="Martinique">Martinique</option><option value="Mauritania">Mauritania</option><option value="Mauritius">Mauritius</option><option value="Mayotte">Mayotte</option><option value="Mexico">Mexico</option><option value="Micronesia, Federated States of">Micronesia, Federated States of</option><option value="Moldova, Republic of">Moldova, Republic of</option><option value="Monaco">Monaco</option><option value="Mongolia">Mongolia</option><option value="Montserrat">Montserrat</option><option value="Morocco">Morocco</option><option value="Mozambique">Mozambique</option><option value="Myanmar">Myanmar</option><option value="Namibia">Namibia</option><option value="Nauru">Nauru</option><option value="Nepal">Nepal</option><option value="Netherlands">Netherlands</option><option value="Netherlands Antilles">Netherlands Antilles</option><option value="New Caledonia">New Caledonia</option><option value="New Zealand">New Zealand</option><option value="Nicaragua">Nicaragua</option><option value="Niger">Niger</option><option value="Nigeria">Nigeria</option><option value="Niue">Niue</option><option value="Norfolk Island">Norfolk Island</option><option value="Northern Mariana Islands">Northern Mariana Islands</option><option value="Norway">Norway</option><option value="Oman">Oman</option><option value="Pakistan">Pakistan</option><option value="Palau">Palau</option><option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option><option value="Panama">Panama</option><option value="Papua New Guinea">Papua New Guinea</option><option value="Paraguay">Paraguay</option><option value="Peru">Peru</option><option value="Philippines">Philippines</option><option value="Pitcairn">Pitcairn</option><option value="Poland">Poland</option><option value="Portugal">Portugal</option><option value="Puerto Rico">Puerto Rico</option><option value="Qatar">Qatar</option><option value="Reunion">Reunion</option><option value="Romania">Romania</option><option value="Russian Federation">Russian Federation</option><option value="Rwanda">Rwanda</option><option value="Saint Helena">Saint Helena</option><option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option><option value="Saint Lucia">Saint Lucia</option><option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option><option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option><option value="Samoa">Samoa</option><option value="San Marino">San Marino</option><option value="Sao Tome and Principe">Sao Tome and Principe</option><option value="Saudi Arabia">Saudi Arabia</option><option value="Senegal">Senegal</option><option value="Serbia and Montenegro">Serbia and Montenegro</option><option value="Seychelles">Seychelles</option><option value="Sierra Leone">Sierra Leone</option><option value="Singapore">Singapore</option><option value="Slovakia">Slovakia</option><option value="Slovenia">Slovenia</option><option value="Solomon Islands">Solomon Islands</option><option value="Somalia">Somalia</option><option value="South Africa">South Africa</option><option value="South Georgia and the South Sandwich Islands">South Georgia and the South Sandwich Islands</option><option value="Spain">Spain</option><option value="Sri Lanka">Sri Lanka</option><option value="Sudan">Sudan</option><option value="Suriname">Suriname</option><option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option><option value="Swaziland">Swaziland</option><option value="Sweden">Sweden</option><option value="Switzerland">Switzerland</option><option value="Syrian Arab Republic">Syrian Arab Republic</option><option value="Taiwan, Province of China">Taiwan, Province of China</option><option value="Tajikistan">Tajikistan</option><option value="Tanzania, United Republic of">Tanzania, United Republic of</option><option value="Thailand">Thailand</option><option value="Timor-Leste">Timor-Leste</option><option value="Togo">Togo</option><option value="Tokelau">Tokelau</option><option value="Tonga">Tonga</option><option value="Trinidad and Tobago">Trinidad and Tobago</option><option value="Tunisia">Tunisia</option><option value="Turkey">Turkey</option><option value="Turkmenistan">Turkmenistan</option><option value="Turks and Caicos Islands">Turks and Caicos Islands</option><option value="Tuvalu">Tuvalu</option><option value="Uganda">Uganda</option><option value="Ukraine">Ukraine</option><option value="United Arab Emirates">United Arab Emirates</option><option value="United Kingdom">United Kingdom</option><option value="United States">United States</option><option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option><option value="Uruguay">Uruguay</option><option value="Uzbekistan">Uzbekistan</option><option value="Vanuatu">Vanuatu</option><option value="Venezuela">Venezuela</option><option value="Viet Nam">Viet Nam</option><option value="Virgin Islands, British">Virgin Islands, British</option><option value="Virgin Islands, U.s.">Virgin Islands, U.s.</option><option value="Wallis and Futuna">Wallis and Futuna</option><option value="Western Sahara">Western Sahara</option><option value="Yemen">Yemen</option><option value="Zambia">Zambia</option><option value="Zimbabwe">Zimbabwe</option></select>
                            </div>

                            <div class="control-group">
                                <div class="controls">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="block">
                <div class="navbar navbar-inner block-header">
                    <div class="muted pull-left">Return Customers</div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <div class="alert alert-error">
                            All fields are required.
                        </div>
                        <form class="form-horizontal">
                            <div class="control-group">
                                <label for="email">Email Address</label>
                                <input type="text" id="email" value="" placeholder="Email Address">
                            </div>

                            <div class="control-group">
                                <label for="password">Password</label>
                                <input type="text" id="password" value="" placeholder="Password">
                            </div>

                            <div class="control-group">
                                <div class="controls">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="block">
                <div class="navbar navbar-inner block-header">
                    <div class="muted pull-left">Questions?</div>
                    <div class="pull-right">Help!</div>
                </div>
                <div class="block-content collapse in">
                    <div class="span12">
                        <ul class="unstyled">
                            <li><i class="icon-chevron-right"></i> <a href=''>Order status</a></li>
                            <li><i class="icon-chevron-right"></i> <a href=''>Frequently Asked Questions</a></li>
                            <li><i class="icon-chevron-right"></i> <a href=''>Online Chat</a></li>
                            <li><i class="icon-chevron-right"></i> <a href=''>Contact a real, live dirty person for help</a></li>
                            <li><i class="icon-chevron-right"></i> <a href=''>Contact Us</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr>
</div> <!-- /container -->
<div class="footer">
    <div class="row-fluid">
        <div class="col-lg-12">
            <ul class="mendi-social-networks">
                <li class="facebook" style="height: 100%">
                    <a href="" title="">
                        <i class="fa fa-facebook"> </i>
                        <p>JOIN US ON FACEBOOK</p>
                        <span class="followers">268K Followers</span>
                    </a>
                </li>
                <li class="twitter" style="height: 100%">
                    <a href="" title="">
                        <i class="fa fa-twitter"> </i>
                        <p>FOLLOW US ON TWITTER</p>
                        <span class="followers">268K Followers</span>
                    </a>
                </li>
                <li class="googleplus" style="height: 100%">
                    <a href="" title="">
                        <i class="fa fa-google-plus"> </i>
                        <p>ADD TO OUR CIRCLE</p>
                        <span class="followers">268K Followers</span>
                    </a>
                </li>
                <li class="linkedin" style="height: 100%">
                    <a href="" title="">
                        <i class="fa fa-linkedin"> </i>
                        <p>CONNECT TO OUR NETWORK</p>
                        <span class="followers">268K Followers</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
