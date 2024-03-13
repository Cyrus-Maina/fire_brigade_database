/* we have a fire brigade database which we will query to retrieve desired results as asked by the shareholders
WELCOME!*/

use country_fire_authority;

#Retrieve the names of all fire stations along with their respective locations and operation types.
SELECT 
    st.name, st.location, st.operation_type
FROM
    stations st
;


#List all incidents that occurred in urban areas, including their types, descriptions, and locations.
SELECT 
    type, description, location
FROM
    incidents
WHERE
    type = 'Urban'
;


#Find the total number of incidents reported for each type of fire (urban, rural, forest).
SELECT 
    type, COUNT(type) AS number_of_incidents
FROM
    incidents
GROUP BY type;


#Display the equipment names and models used in incidents along with their capacities.
SELECT 
    i.equipment_id, e.name, e.model, e.capacity
FROM
    equipment e
        JOIN
    incident_equipment i ON e.id = i.equipment_id
;


#Show the names of all members along with their contact numbers and emergency contact details.
SELECT 
    m.first_name,
    m.last_name,
    m.phone_number,
    em.contact_number AS emergency_number
FROM
    member m
        JOIN
    emergency_contact em ON m.id = em.mem_id
;


#Identify the fire station with the highest number of equipment vehicles.
SELECT 
    s.name, se.no_of_vehicle
FROM
    station_equipment se
        JOIN
    stations s ON se.stat_id = s.id
ORDER BY no_of_vehicle DESC
LIMIT 1;


#List all incidents that occurred between January 1, 2020, and December 31, 2020, including their types, descriptions, and locations
SELECT 
    id, type, description, location
FROM
    incidents
WHERE
    start_time BETWEEN '2020-1-1' AND '2020-12-31'
;


#Find the total number of incidents each fire station responded to.
select st.name, i.stat_id, count(i.incident_id) as incidents_handled
from
incident_station i join stations st
on i.stat_id=st.id
group by stat_id ;


#Retrieve the names of all members who are part of the Fire Brigade, along with their respective stations.
SELECT 
    m.first_name, m.last_name, mb.brigade_id, b.brigade_name
FROM
    member m
        JOIN
    member_brigade mb ON m.id = mb.mem_id
        JOIN
    brigade b ON b.id = mb.brigade_id
WHERE
    b.id = '1'
;


#Show the names and models of equipment used in incidents that occurred in Port Melbourne.
SELECT 
    e.name, e.model
FROM
    equipment e
        JOIN
    incident_equipment ie ON e.id = ie.equipment_id
        JOIN
    incidents i ON ie.incident_id = i.id
WHERE
    i.location like '%Port Melbourne%' #which equipments are mostly used in that city
;
