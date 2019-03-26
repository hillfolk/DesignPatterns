package abstract_factory

type LuxuryCar struct{}


func (*LuxuryCar) GetDoors() int{
	return 4
}

func (*LuxuryCar) GetWheels() int{
	return 4
}

func (*LuxuryCar) GetSeats() int{
	return 5
}

