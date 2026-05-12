extends CharacterBody2D

const SPEED = 100.0
const DETECTION_RANGE = 200.0
const ATTACK_DAMAGE = 5.0
const ATTACK_COOLDOWN = 1.0

var health = 30
var max_health = 30
var player = null
var is_chasing = false
var attack_cooldown = 0.0
var patrol_direction = 1

func _ready():
	player = get_tree().get_first_child_in_group("player")

func _physics_process(delta):
	# Add gravity
	if not is_on_floor():
		velocity.y += get_gravity() * delta

	if player:
		var distance = global_position.distance_to(player.global_position)
		
		if distance < DETECTION_RANGE:
			is_chasing = true
			if player.global_position.x > global_position.x:
				velocity.x = SPEED
			else:
				velocity.x = -SPEED
		else:
			is_chasing = false
			velocity.x = SPEED * patrol_direction
			
			if global_position.x < 50 or global_position.x > 750:
				patrol_direction *= -1
		
		# Attack if close enough
		if distance < 50 and attack_cooldown <= 0:
			player.take_damage(ATTACK_DAMAGE)
			attack_cooldown = ATTACK_COOLDOWN
	else:
		velocity.x = SPEED * patrol_direction

	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false

	if attack_cooldown > 0:
		attack_cooldown -= delta

	move_and_slide()

func take_damage(damage):
	health -= damage
	if health <= 0:
		die()

func die():
	queue_free()
