select * from physics;

-- Question: Retrieve the average temperature recorded in a specific experiment conducted in a physics laboratory.

SELECT AVG(temperature) AS average_temperature
FROM experiment_data
WHERE experiment_id = '4';


-- Question: List the top 5 experiments with the highest recorded pressure values.

SELECT experiment_id, MAX(pressure) AS max_pressure
FROM experiment_data
GROUP BY experiment_id
ORDER BY max_pressure DESC
LIMIT 5;


-- Question: Calculate the total kinetic energy of all particles in a specific experiment using the formula KE = 0.5 * mass * velocity^2.

SELECT SUM(0.5 * mass * velocity * velocity) AS total_kinetic_energy
FROM experiment_data
WHERE experiment_id = '2';

-- Question: Find the number of collisions recorded in each experiment.

SELECT experiment_id, COUNT(*) AS collision_count
FROM experiment_data
GROUP BY experiment_id;

-- Question: Retrieve the names and masses of particles involved in collisions where the energy released was above a certain threshold.
SELECT particle_name, mass
FROM particle_data
WHERE particle_id IN (
    SELECT particle_id
    FROM collision_data
    WHERE energy > 'threshold_energy'
);

-- Question: Calculate the total momentum transferred during collisions in each experiment.

SELECT experiment_id, SUM(momentum) AS total_momentum_transferred
FROM (
    SELECT experiment_id, mass * velocity AS momentum
    FROM particle_data
    JOIN collision_data ON particle_data.particle_id = collision_data.particle_id
) AS momentum_data
GROUP BY experiment_id;

--  Find the average speed of particles in each experiment, considering only particles with a velocity above a certain threshold.

SELECT cd.experiment_id, AVG(pd.velocity) AS average_speed
FROM particle_data pd
JOIN collision_data cd ON pd.particle_id = cd.particle_id
WHERE pd.velocity > 'threshold_velocity'
GROUP BY cd.experiment_id;







