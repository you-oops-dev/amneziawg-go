//go:build !linux

package device

import (
	"github.com/naruto522ru/amneziawg-go/conn"
	"github.com/naruto522ru/amneziawg-go/rwcancel"
)

func (device *Device) startRouteListener(bind conn.Bind) (*rwcancel.RWCancel, error) {
	return nil, nil
}
