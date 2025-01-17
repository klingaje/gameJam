if (instance_exists(other_instance))
{
    instance_destroy(other_instance);
}

// Clear the reference to avoid future issues
other_instance = noone;