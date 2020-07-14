function Vehicle = sm_car_vehcfg_setBody(Vehicle,body_opt)
% Copy data from VDatabase to Vehicle data structure
%
% Copyright 2019-2020 The MathWorks, Inc.

% Load database of vehicle data into local workspace
VDatabase = evalin('base','VDatabase');

switch body_opt
    case 'Sedan_HambaLG',          instance = 'Sedan_HambaLG';
    case 'Sedan_Hamba',            instance = 'Sedan_Hamba';
    case 'Bus_Makhulu',            instance = 'Bus_Makhulu';
    case 'Trailer_Elula',          instance = 'Trailer_Elula';
    case 'Trailer_Elula_Unstable', instance = 'Trailer_Elula_Unstable';
    case 'Trailer_Thwala',         instance = 'Trailer_Thwala';
end

% Copy data from database into Vehicle data structure
Vehicle.Chassis.Body = VDatabase.Body.(instance);

% Modify config string to indicate configuration has been modified
% Platform is decided by body type, which defines length
    % Field config does not exist when Vehicle structure is first created
    veh_body_set =  strsplit(instance,'_');
    Vehicle.config =  veh_body_set{2};
end