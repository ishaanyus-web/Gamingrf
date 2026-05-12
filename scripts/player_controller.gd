extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0
const ATTACK_RANGE = 50.0
const ATTACK_DAMAGE = 10.0

var health = 100
var max_health = 100
var is_attacking = false
var attack_cooldown = 0.0

func _physics_process(delta):
	# Add gravity
	if not is_on_floor():
		velocity.y += get_gravity() * delta

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movement
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity.x = input_dir.x * SPEED

	# Attack
	if Input.is_action_just_pressed("ui_select"):
		attack()

	# Update animation
	if velocity.x != 0:
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")

	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false

	move_and_slide()

	# Update attack cooldown
	if attack_cooldown > 0:
		attack_cooldown -= delta

func attack():
	if attack_cooldown <= 0:
		is_attacking = true
		attack_cooldown = 0.5
		$AnimatedSprite2D.play("attack")
		
		# Check for enemy hits
		var space_state = get_world_2d().direct_space_state
		var query = PhysicsShapeQueryParameters2D.new()
		query.shape = CircleShape2D.new()
		query.shape.radius = ATTACK_RANGE
		query.transform = global_transform
		
		var results = space_state.intersect_shape(query)
		for result in results:
			if result.collider.has_method("take_damage"):
				result.collider.take_damage(ATTACK_DAMAGE)

func take_damage(damage):
	health -= damage
	if health <= 0:
		die()

func die():
	queue_free()
