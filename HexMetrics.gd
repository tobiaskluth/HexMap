const OUTER_RADIUS = 2 # The outer radius of planes in Godot is 2

const INNER_RADIUS = OUTER_RADIUS * 0.866025404

const CORNERS = [
		Vector3(0, 0, OUTER_RADIUS),
		Vector3(INNER_RADIUS, 0, 0.5 * OUTER_RADIUS),
		Vector3(INNER_RADIUS, 0, -0.5 * OUTER_RADIUS),
		Vector3(0, 0, -OUTER_RADIUS),
		Vector3(-INNER_RADIUS, 0, -0.5 * OUTER_RADIUS),
		Vector3(-INNER_RADIUS, 0, 0.5 * OUTER_RADIUS),
		Vector3(0, 0, OUTER_RADIUS),
	]
